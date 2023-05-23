import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/scanned_product_entities.dart';
import 'package:skin_scan/models/ingredient_model.dart';
import 'package:skin_scan/models/routine_product_model.dart';
import 'package:skin_scan/entities/routine_entities.dart';
import 'package:skin_scan/models/scanned_product_model.dart';
import '../entities/ingredient_entities.dart';
import '../models/routine_model.dart';
import '../models/users_model.dart';
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
  List<ScannedProduct> ScannedProductlist = [];

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
        UserModel currentUser =
            UserModel.fromJson(doc.data() as Map<String, dynamic>);
        currentUser.userID = doc.id;
        var routines = currentUser.UserRoutines.map((e) => Routine(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) => RoutineProducts(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList())).toList();

        var scannedProd = currentUser.ScannedProducts.map((e) => ScannedProduct(
            productName: e.productName,
            ingredientList: e.ingredientList
                .map((p) => Ingredient(
                      ingredientName: p.ingredientName,
                      ingredientCategory: p.ingredientCategory,
                      ingredientDescription: p.ingredientDescription,
                      ingredientRating: p.ingredientRating,
                    ))
                .toList())).toList();

        user = Users(
            UserName: currentUser.UserName,
            UserEmail: currentUser.UserEmail,
            UserRoutines: routines,
            UserFavouriteProducts: currentUser.UserFavouriteProducts,
            ScannedProducts: scannedProd);
        user.userID = currentUser.userID;
      } else {
        Routine AMroutine = Routine(RoutineName: "Morning", listofproducts: []);
        Routine PMroutine = Routine(RoutineName: "Night", listofproducts: []);
        user = Users(
            UserName: '',
            UserRoutines: [AMroutine, PMroutine],
            UserFavouriteProducts: [],
            UserEmail: '',
            ScannedProducts: []);
      }
      AMlist = user.UserRoutines[0].listofproducts;
      PMlist = user.UserRoutines[1].listofproducts;
      ScannedProductlist = user.ScannedProducts;
      currUser = user;
      getCurrentUser();
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
        var routines = newuser.UserRoutines.map((e) => Routine(
            RoutineName: e.RoutineName,
            listofproducts: e.listofproducts
                .map((p) => RoutineProducts(
                    productname: p.productname,
                    category: p.category,
                    days: p.days))
                .toList())).toList();

        var scannedProd = newuser.ScannedProducts.map((e) => ScannedProduct(
            productName: e.productName,
            ingredientList: e.ingredientList
                .map((p) => Ingredient(
                      ingredientName: p.ingredientName,
                      ingredientCategory: p.ingredientCategory,
                      ingredientDescription: p.ingredientDescription,
                      ingredientRating: p.ingredientRating,
                    ))
                .toList())).toList();
        Users user = Users(
            UserName: newuser.UserName,
            UserEmail: newuser.UserEmail,
            UserRoutines: routines,
            UserFavouriteProducts: newuser.UserFavouriteProducts,
            ScannedProducts: scannedProd);
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

    var scannedProd = thisuser.ScannedProducts.map((e) => ScannedProductModel(
        productName: e.productName,
        ingredientList: e.ingredientList
            .map((p) => IngredientModel(
                  ingredientName: p.ingredientName,
                  ingredientCategory: p.ingredientCategory,
                  ingredientDescription: p.ingredientDescription,
                  ingredientRating: p.ingredientRating,
                ))
            .toList())).toList();

    UserModel databaseuser = UserModel(
        userID: thisuser.userID,
        UserName: thisuser.UserName,
        UserEmail: thisuser.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: thisuser.UserFavouriteProducts,
        ScannedProducts: scannedProd);

    CollectionReference database =
        FirebaseFirestore.instance.collection('users');
    var test = databaseuser.toJson();
    DocumentReference docref = await database.add(test);
    databaseuser.userID = docref.id;
    notifyListeners();
  }

  addProductToRoutine(RoutineProducts newProduct, String name) {
    Users user = getCurrentUser();

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

    var userroutine = user.UserRoutines.map((e) => RoutineModel(
        RoutineName: e.RoutineName,
        listofproducts: e.listofproducts
            .map((p) => RoutineProductsModel(
                productname: p.productname, category: p.category, days: p.days))
            .toList())).toList();

    var scannedProd = user.ScannedProducts.map((e) => ScannedProductModel(
        productName: e.productName,
        ingredientList: e.ingredientList
            .map((p) => IngredientModel(
                  ingredientName: p.ingredientName,
                  ingredientCategory: p.ingredientCategory,
                  ingredientDescription: p.ingredientDescription,
                  ingredientRating: p.ingredientRating,
                ))
            .toList())).toList();

    UserModel updatedUser = UserModel(
        userID: user.userID,
        UserName: user.UserName,
        UserEmail: user.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: user.UserFavouriteProducts,
        ScannedProducts: scannedProd);

    updateUserDetails(updatedUser);
  }

  void updateUserDetails(UserModel user) async {
    CollectionReference database =
        FirebaseFirestore.instance.collection('users');
    await database.doc(user.userID).update(user.toJson());
    notifyListeners();
  }

  Future removeProductFromRoutine(
      RoutineProducts removeProduct, String name) async {
    Users user = getCurrentUser();

    if (name == 'Morning') {
      user.UserRoutines[0].listofproducts.removeWhere(
          (element) => element.productname == removeProduct.productname);
      AMlist = user.UserRoutines[0].listofproducts;
    }

    if (name == 'Night') {
      user.UserRoutines[1].listofproducts.removeWhere(
          (element) => element.productname == removeProduct.productname);
      PMlist = user.UserRoutines[1].listofproducts;
    }

    var userroutine = user.UserRoutines.map((e) => RoutineModel(
        RoutineName: e.RoutineName,
        listofproducts: e.listofproducts
            .map((p) => RoutineProductsModel(
                productname: p.productname, category: p.category, days: p.days))
            .toList())).toList();

    var scannedProd = user.ScannedProducts.map((e) => ScannedProductModel(
        productName: e.productName,
        ingredientList: e.ingredientList
            .map((p) => IngredientModel(
                  ingredientName: p.ingredientName,
                  ingredientCategory: p.ingredientCategory,
                  ingredientDescription: p.ingredientDescription,
                  ingredientRating: p.ingredientRating,
                ))
            .toList())).toList();

    UserModel updatedUser = UserModel(
        userID: user.userID,
        UserName: user.UserName,
        UserEmail: user.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: user.UserFavouriteProducts,
        ScannedProducts: scannedProd);

    updateUserDetails(updatedUser);
    notifyListeners();
  }

  void updateUserFavouriteProducts(UserModel user) async {
    CollectionReference database =
        FirebaseFirestore.instance.collection('users');

    await database.doc(user.userID).update(user.toJson());
    //getCurrentUserFromDb();
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
        if (user.UserFavouriteProducts[j] == productsList[i].prodID) {
          FavouriteLists.add(productsList[i]);
        }
      }
    }
    //notifyListeners();
    return FavouriteLists;
  }

  addProductToFavourites(var prodID) {
    Users user = getCurrentUser();


    if (!user.UserFavouriteProducts.contains(prodID)) {
      if (user.UserFavouriteProducts.isNotEmpty) {
        currentUserFavList = user.UserFavouriteProducts;
      }
      currentUserFavList.add(prodID);
      user.UserFavouriteProducts = currentUserFavList;

      var userroutine = user.UserRoutines.map((e) => RoutineModel(
          RoutineName: e.RoutineName,
          listofproducts: e.listofproducts
              .map((p) => RoutineProductsModel(
                  productname: p.productname,
                  category: p.category,
                  days: p.days))
              .toList())).toList();

      var scannedProd = user.ScannedProducts.map((e) => ScannedProductModel(
          productName: e.productName,
          ingredientList: e.ingredientList
              .map((p) => IngredientModel(
                    ingredientName: p.ingredientName,
                    ingredientCategory: p.ingredientCategory,
                    ingredientDescription: p.ingredientDescription,
                    ingredientRating: p.ingredientRating,
                  ))
              .toList())).toList();

      UserModel updatedUser = UserModel(
          userID: user.userID,
          UserName: user.UserName,
          UserEmail: user.UserEmail,
          UserRoutines: userroutine,
          UserFavouriteProducts: user.UserFavouriteProducts,
          ScannedProducts: scannedProd);

      updateUserFavouriteProducts(updatedUser);
    }
  }

  Future removeProductFromFavourites(var prodID) async {

    Users user = getCurrentUser();
    currentUserFavList.remove(prodID);
    user.UserFavouriteProducts = currentUserFavList;
    var userroutine = user.UserRoutines.map((e) => RoutineModel(
        RoutineName: e.RoutineName,
        listofproducts: e.listofproducts
            .map((p) => RoutineProductsModel(
                productname: p.productname, category: p.category, days: p.days))
            .toList())).toList();

    var scannedProd = user.ScannedProducts.map((e) => ScannedProductModel(
        productName: e.productName,
        ingredientList: e.ingredientList
            .map((p) => IngredientModel(
                  ingredientName: p.ingredientName,
                  ingredientCategory: p.ingredientCategory,
                  ingredientDescription: p.ingredientDescription,
                  ingredientRating: p.ingredientRating,
                ))
            .toList())).toList();
    UserModel updatedUser = UserModel(
        userID: user.userID,
        UserName: user.UserName,
        UserEmail: user.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: user.UserFavouriteProducts,
        ScannedProducts: scannedProd);

    updateUserFavouriteProducts(updatedUser);
  }

  storeScannedProduct(ScannedProduct product) {
    Users user = getCurrentUser();

    ScannedProductlist = user.ScannedProducts;
    ScannedProductlist.add(product);
    user.ScannedProducts = ScannedProductlist;

    var userroutine = user.UserRoutines.map((e) => RoutineModel(
        RoutineName: e.RoutineName,
        listofproducts: e.listofproducts
            .map((p) => RoutineProductsModel(
                productname: p.productname, category: p.category, days: p.days))
            .toList())).toList();

    var scannedProd = user.ScannedProducts.map((e) => ScannedProductModel(
        productName: e.productName,
        ingredientList: e.ingredientList
            .map((p) => IngredientModel(
                  ingredientName: p.ingredientName,
                  ingredientCategory: p.ingredientCategory,
                  ingredientDescription: p.ingredientDescription,
                  ingredientRating: p.ingredientRating,
                ))
            .toList())).toList();

    UserModel updatedUser = UserModel(
        userID: user.userID,
        UserName: user.UserName,
        UserEmail: user.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: user.UserFavouriteProducts,
        ScannedProducts: scannedProd);

    updateUserDetails(updatedUser);
  }

  editProfile(String name) {
    Users user = getCurrentUser();

    var userroutine = user.UserRoutines.map((e) => RoutineModel(
        RoutineName: e.RoutineName,
        listofproducts: e.listofproducts
            .map((p) => RoutineProductsModel(
                productname: p.productname, category: p.category, days: p.days))
            .toList())).toList();

    var scannedProd = user.ScannedProducts.map((e) => ScannedProductModel(
        productName: e.productName,
        ingredientList: e.ingredientList
            .map((p) => IngredientModel(
                  ingredientName: p.ingredientName,
                  ingredientCategory: p.ingredientCategory,
                  ingredientDescription: p.ingredientDescription,
                  ingredientRating: p.ingredientRating,
                ))
            .toList())).toList();

    UserModel updatedUser = UserModel(
        userID: user.userID,
        UserName: name,
        UserEmail: user.UserEmail,
        UserRoutines: userroutine,
        UserFavouriteProducts: user.UserFavouriteProducts,
        ScannedProducts: scannedProd);
    updateUserDetails(updatedUser);
    getCurrentUserFromDb();
    notifyListeners();

  }
}
