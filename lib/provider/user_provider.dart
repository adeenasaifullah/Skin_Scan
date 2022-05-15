import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/models/product_model.dart';
import 'package:skin_scan/models/routine_product_model.dart';
import 'package:skin_scan/entities/routine_entities.dart';
import 'package:skin_scan/profile_feature/favourite_products.dart';
import 'package:skin_scan/provider/product_provider.dart';
import '../models/routine_model.dart';
import '../models/users_adeena_model.dart';
import '../entities/product_entities.dart';
import '../entities/routine_product_entities.dart';
import '../entities/user_entities.dart';

class UserProvider extends ChangeNotifier {

  final List<Users> allUsers = [];
  late Users currUser;
  List<String> currentUserFavList = [];
  List<RoutineProducts> AMlist = [];
  List<RoutineProducts> PMlist = [];
  List<Product> FavouriteLists = [];

  List<String> getCurrentUserList() {
    return currentUserFavList;
  }

  Future<void> getCurrentUserFromDb() async {
      var currentUser = FirebaseAuth.instance.currentUser!;
      Users user;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          UserModel currentUser = UserModel.fromJson(
              doc.data() as Map<String, dynamic>);
          currentUser.userID = doc.id;
          var routines = currentUser.UserRoutines.map((e) =>
              Routine(
                  RoutineName: e.RoutineName,
                  listofproducts: e.listofproducts
                      .map((p) =>
                      RoutineProducts(
                          productname: p.productname,
                          category: p.category,
                          days: p.days))
                      .toList())).toList();
          user = Users(
            UserName: currentUser.UserName,
            UserEmail: currentUser.UserEmail,
            UserRoutines: routines,
            UserFavouriteProducts: currentUser.UserFavouriteProducts,
          );
          user.userID = currentUser.userID;
        } else {
          Routine AMroutine = Routine(
              RoutineName: "Morning", listofproducts: []);
          Routine PMroutine = Routine(RoutineName: "Night", listofproducts: []);
          user = Users(
            UserName: '',
            UserRoutines: [AMroutine, PMroutine],
            UserFavouriteProducts: [],
            UserEmail: '',
          );
        }
        currUser = user;
        notifyListeners();
      });
    }

    Users getCurrentUser() {
    return currUser;
    }

  Future getUsersfromDB() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        UserModel newuser =
            UserModel.fromJson(doc.data() as Map<String, dynamic>);
        newuser.userID = doc.id;
        print(doc.id);
        print(newuser.UserName);
        var routines = newuser.UserRoutines.map((e) => Routine(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) => RoutineProducts(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList())).toList();
        Users user = Users(
          UserName: newuser.UserName,
          UserEmail: newuser.UserEmail,
          UserRoutines: routines,
          UserFavouriteProducts: newuser.UserFavouriteProducts,
        );

        user.userID = newuser.userID;
        allUsers.add(user);
      });
      notifyListeners();
      return allUsers;
    });
  }

  Future storeUserinDB(Users thisuser) async {
    var userroutine = thisuser.UserRoutines.map((e) => RoutineModel(
        RoutineName: e.RoutineName,
        listofproducts: e.listofproducts
            .map((p) => RoutineProductsModel(
                productname: p.productname, category: p.category, days: p.days))
            .toList())).toList();

    UserModel databaseuser = UserModel(
      userID: thisuser.userID,
      UserName: thisuser.UserName,
      UserEmail: thisuser.UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: thisuser.UserFavouriteProducts,
    );

    CollectionReference database =
        FirebaseFirestore.instance.collection('users');
    var test = databaseuser.toJson();
    DocumentReference docref = await database.add(test);
    databaseuser.userID = docref.id;
    notifyListeners();
  }

  addProductToRoutine(RoutineProducts newProduct, String name) {
    Users user = getCurrentUser();
    //int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);

    if (name == 'Morning') {
      if (user.UserRoutines[0].listofproducts.isNotEmpty) {
        AMlist = user.UserRoutines[0].listofproducts;
      }

      AMlist.add(newProduct);
      user.UserRoutines[0].listofproducts = AMlist;
      user.UserRoutines[0].numofproducts++;
    }

    if (name == 'Night') {
      if (user.UserRoutines[1].listofproducts.isNotEmpty) {
        PMlist = user.UserRoutines[1].listofproducts;
      }

      PMlist.add(newProduct);
      user.UserRoutines[1].listofproducts = PMlist;
      user.UserRoutines[1].numofproducts++;
    }

    var userroutine = user
        .UserRoutines
        .map((e) => RoutineModel(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) => RoutineProductsModel(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList()))
        .toList();

    UserModel updatedUser = UserModel(
      userID: user.userID,
      UserName: user.UserName,
      UserEmail: user.UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: user.UserFavouriteProducts,
    );

    updateUserRoutine(updatedUser);
    print('firestore id ' + user.userID);
    print('auth id ' + FirebaseAuth.instance.currentUser!.uid);

    print("Product has been added to Routine");

  }

  void updateUserRoutine(UserModel user) async {
    CollectionReference database = FirebaseFirestore.instance.collection('users');
    await database.doc(user.userID).update(user.toJson());
    print('Routine has been updated.');
    notifyListeners();
  }

  Future removeProductFromRoutine(RoutineProducts removeProduct, String name) async {
    Users user = getCurrentUser();
    // final currentUser = FirebaseAuth.instance.currentUser!;
    // int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);

    if (name == 'Morning') {
      AMlist.removeWhere(
          (element) => element.productname == removeProduct.productname);
      user.UserRoutines[0].listofproducts = AMlist;
    }

    if (name == 'Night') {
      PMlist.removeWhere(
          (element) => element.productname == removeProduct.productname);
      user.UserRoutines[1].listofproducts = PMlist;
    }

    var userroutine = user
        .UserRoutines
        .map((e) => RoutineModel(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) => RoutineProductsModel(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList()))
        .toList();

    UserModel updatedUser = UserModel(
      userID: user.userID,
      UserName: user.UserName,
      UserEmail: user.UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: user.UserFavouriteProducts,
    );

    updateUserRoutine(updatedUser);
    notifyListeners();
  }

  void updateUserFavouriteProducts(UserModel user) async {
    // final currentUser = FirebaseAuth.instance.currentUser!;
    CollectionReference database =
        FirebaseFirestore.instance.collection('users');

    await database.doc(user.userID).update(user.toJson());
    print('fav product has been updated');
    notifyListeners();
  }


  bool checkUserFavouriteProduct(var prodID) {
    Users user = getCurrentUser();
    if (user.UserFavouriteProducts.contains(prodID)) {
      return true;
    } else
      return false;
  }

  List<Product> getUserFavouriteProducts(List<Product> productsList) {
    FavouriteLists.clear();
    Users user = getCurrentUser();
    for (int i = 0; i < productsList.length; i++) {
      for (int j = 0; j < user.UserFavouriteProducts.length; j++) {
        if (user.UserFavouriteProducts[j] ==
            productsList[i].prodID) {
          FavouriteLists.add(productsList[i]);
          print("This is the product list");
          print(productsList[i]);
        }
      }
    }

    notifyListeners();
    print("Fav list");
    print(FavouriteLists);
    return FavouriteLists;
    //currentUserFavList;
  }

  addProductToFavourites(var prodID) {
    Users user = getCurrentUser();

    print("The product id is " + prodID);
    if (!user.UserFavouriteProducts.contains(prodID)) {
      // currentUserFavList.add(prodID);
      print(currentUserFavList);
      if (user.UserFavouriteProducts.isNotEmpty) {
        currentUserFavList = user.UserFavouriteProducts;
      }
      currentUserFavList.add(prodID);
      user.UserFavouriteProducts = currentUserFavList;

      var userroutine = user
          .UserRoutines
          .map((e) => RoutineModel(
              RoutineName: e.RoutineName,
              listofproducts: e.listofproducts
                  .map((p) => RoutineProductsModel(
                      productname: p.productname,
                      category: p.category,
                      days: p.days))
                  .toList()))
          .toList();

      UserModel updatedUser = UserModel(
        userID: user.userID,
        UserName: user.UserName,
        UserEmail: user.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: user.UserFavouriteProducts,
      );

      updateUserFavouriteProducts(updatedUser);

      print('firestore id ' + user.userID);
      // print('auth id ' + user.uid);

      print("Product has been added to favourites");

    }
  }

  Future removeProductFromFavourites(var prodID) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);

    Users user = getCurrentUser();
    print("The product id is " + prodID);
    currentUserFavList.remove(prodID);
    user.UserFavouriteProducts = currentUserFavList;
    var userroutine = user
        .UserRoutines
        .map((e) => RoutineModel(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) => RoutineProductsModel(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList()))
        .toList();

    UserModel updatedUser = UserModel(
      userID: user.userID,
      UserName: user.UserName,
      UserEmail: user.UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: user.UserFavouriteProducts,
    );

    updateUserFavouriteProducts(updatedUser);
  }
}
