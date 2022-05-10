import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/Models/product_model.dart';
import 'package:skin_scan/Models/routine_product_model.dart';
import 'package:skin_scan/entities/routine_entities.dart';
import 'package:skin_scan/profile_feature/favourite_products.dart';
import 'package:skin_scan/provider/product_provider.dart';

import '../Models/routine_model.dart';
import '../Models/users_adeena_model.dart';
import '../entities/product_entities.dart';
import '../entities/routine_product_entities.dart';
import '../entities/user_entities.dart';

class UserProvider extends ChangeNotifier {
  final List<Users> allUsers = [];
  List<String> currentUserFavList = [];
  List<RoutineProducts> AMlist =[];
  List<RoutineProducts> PMlist = [];
  List<Product> FavouriteLists = [];
  List<String> getCurrentUserList() {
    return currentUserFavList;
  }

  final currentUser = FirebaseAuth.instance.currentUser!;

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
        //print(user.UserName);
        print(user.UserRoutines[0].RoutineName);
        print(user.UserEmail);
        allUsers.add(user);

        //print(allUsers);
        //print(allUsers[0].UserName);
        notifyListeners();
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
    print(test);
    DocumentReference docref = await database.add(test);
    databaseuser.userID = docref.id;
  }

  addProductToRoutine(RoutineProducts newProduct, String name) {
    //getUsersfromDB();

    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);

    if(name == 'Morning') {

      if(allUsers[index].UserRoutines[0].listofproducts.isNotEmpty) {

        AMlist = allUsers[index].UserRoutines[0].listofproducts;

      }

      AMlist.add(newProduct);
      allUsers[index].UserRoutines[0].listofproducts = AMlist;
      allUsers[index].UserRoutines[0].numofproducts++;

    }

    if(name == 'Night') {

      if(allUsers[index].UserRoutines[1].listofproducts.isNotEmpty) {

        PMlist = allUsers[index].UserRoutines[1].listofproducts;

      }

      PMlist.add(newProduct);
      allUsers[index].UserRoutines[1].listofproducts = PMlist;
      allUsers[index].UserRoutines[1].numofproducts++;

    }


    var userroutine = allUsers[index]
        .UserRoutines
        .map((e) =>
        RoutineModel(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) =>
                RoutineProductsModel(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList()))
        .toList();

    UserModel updatedUser = UserModel(
      userID: allUsers[index].userID,
      UserName: allUsers[index].UserName,
      UserEmail: allUsers[index].UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: allUsers[index].UserFavouriteProducts,
    );

    updateUserRoutine(updatedUser);

    //allUsers[index].UserFavouriteProducts.add(prodID);
    print('firestore id ' + allUsers[index].userID);
    print('auth id ' + currentUser.uid);

    print("Product has been added to Routine");

    notifyListeners();
  }


  void updateUserRoutine(UserModel user) async {
    CollectionReference database =
    FirebaseFirestore.instance.collection('users');
    await database.doc(user.userID).update(user.toJson());
    print('Routine has been updated.');
    notifyListeners();
  }


  Future removeProductFromRoutine(RoutineProducts removeProduct, String name) async {
    // getUsersfromDB();
    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);

    if(name =='Morning')
    {
      AMlist.removeWhere((element) => element.productname == removeProduct.productname);
      allUsers[index].UserRoutines[0].listofproducts = AMlist;
    }

    if(name =='Night')
    {
      PMlist.removeWhere((element) => element.productname == removeProduct.productname);
      allUsers[index].UserRoutines[1].listofproducts = PMlist;
    }


    var userroutine = allUsers[index]
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
      userID: allUsers[index].userID,
      UserName: allUsers[index].UserName,
      UserEmail: allUsers[index].UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: allUsers[index].UserFavouriteProducts,
    );

    updateUserRoutine(updatedUser);

    notifyListeners();
  }

  void updateUserFavouriteProducts(UserModel user) async {
    CollectionReference database =
        FirebaseFirestore.instance.collection('users');

    print("bhjjkkello");
    await database.doc(user.userID).update(user.toJson());
    //inOrder();
    //await getTasksFromFirebase();
    //getUsersfromDB();
    print('fav product has been updated');
    notifyListeners();
  }

  // List<Product> getUserFavouriteProducts(String name) {
  //   int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);
  //   List<Product> productsOfCategory = [];
  //
  //   for (int i = 0; i < productsList.length; i++) {
  //     //print('snoop');
  //     if (productsList[i].nameOfCategory == name) {
  //       productsOfCategory.add(productsList[i]);
  //     }
  //   }
  //   print("get category products + $productsOfCategory");
  //   return productsOfCategory;
  // }

  bool checkUserFavouriteProduct(var prodID) {
    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);
    if (allUsers[index].UserFavouriteProducts.contains(prodID)) {
      return true;
    } else
      return false;
  }

  List<Product> getUserFavouriteProducts(List<Product> productsList){
    FavouriteLists.clear();
    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);
    print(productsList);
    print('hello fav list');


    for (int i = 0; i < productsList.length; i++) {
      for(int j =0; j< allUsers[index].UserFavouriteProducts.length; j++){
        if ( allUsers[index].UserFavouriteProducts[j]== productsList[i].prodID) {
          FavouriteLists.add(productsList[i]);
          print("This is the product list");
          print(productsList[i]);

        }
      }
      //print('snoop');


    }
    notifyListeners();
    print("Fav list");
    print(FavouriteLists);
    return FavouriteLists;
    //currentUserFavList;

  }

  addProductToFavourites(var prodID) {


    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);
    print("current id " + currentUser.uid);
    print(index);
    print("The product id is " + prodID);
    if (!allUsers[index].UserFavouriteProducts.contains(prodID)) {
      // currentUserFavList.add(prodID);
      print(currentUserFavList);
      if (allUsers[index].UserFavouriteProducts.isNotEmpty) {
        currentUserFavList = allUsers[index].UserFavouriteProducts;
      }
      currentUserFavList.add(prodID);
      allUsers[index].UserFavouriteProducts = currentUserFavList;

      var userroutine = allUsers[index]
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
        userID: allUsers[index].userID,
        UserName: allUsers[index].UserName,
        UserEmail: allUsers[index].UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: allUsers[index].UserFavouriteProducts,
      );

      updateUserFavouriteProducts(updatedUser);

      //allUsers[index].UserFavouriteProducts.add(prodID);
      print('firestore id ' + allUsers[index].userID);
      print('auth id ' + currentUser.uid);

      print("Product has been added to favourites");

      notifyListeners();
    }
    getUsersfromDB();
  }

  Future removeProductFromFavourites(var prodID) async {
    getUsersfromDB();
    int index = allUsers.indexWhere((user) => user.userID == currentUser.uid);

    print("The product id is " + prodID);
    currentUserFavList.remove(prodID);

    allUsers[index].UserFavouriteProducts = currentUserFavList;

    var userroutine = allUsers[index]
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
      userID: allUsers[index].userID,
      UserName: allUsers[index].UserName,
      UserEmail: allUsers[index].UserEmail,
      UserRoutines: userroutine,
      UserFavouriteProducts: allUsers[index].UserFavouriteProducts,
    );

    updateUserFavouriteProducts(updatedUser);

    notifyListeners();
  }
}