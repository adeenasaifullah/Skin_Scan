import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skin_scan/entities/scanned_product_entities.dart';
import '../models/ingredient_model.dart';
import '../models/routine_model.dart';
import '../models/routine_product_model.dart';
import '../entities/routine_entities.dart';
import '../entities/user_entities.dart';
import 'package:skin_scan/models/users_model.dart';

import '../models/scanned_product_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  AuthenticateUser? _userFromFirebaseUser(User? user) {
    return user != null
        ? AuthenticateUser(
            userID: user.uid,
            email: user.email!,
            name: user.displayName ?? "",
          )
        : null;
  }

  Stream<AuthenticateUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          _buildErrorMessage("Your email address appears to be malformed.");
          break;
        case "wrong-password":
          _buildErrorMessage("Your password is wrong.");
          break;
        case "user-not-found":
          _buildErrorMessage("User with this email doesn't exist.");
          break;
        case "user-disabled":
          _buildErrorMessage("User with this email has been disabled.");
          break;
        case "too-many-requests":
          _buildErrorMessage("Too many requests");
          break;
        case "operation-not-allowed":
          _buildErrorMessage(
              "Signing in with Email and Password is not enabled.");
          break;
        default:
          _buildErrorMessage("An undefined Error happened.");
          return null;
      }
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(email);
      print(password);
      User user = result.user!;
      String authID = user.uid;

      Routine AMroutine = Routine(RoutineName: "Morning", listofproducts: []);
      Routine PMroutine = Routine(RoutineName: "Night", listofproducts: []);

      List<String> favourite_products = [];
      List<Routine> routine_list = [];
      routine_list.add(AMroutine);
      routine_list.add(PMroutine);
      List<ScannedProduct> ScannedProducts = [];
      Users obj = Users(
          UserName: user.displayName ?? "",
          UserEmail: email,
          UserRoutines: routine_list,
          UserFavouriteProducts: favourite_products,
          ScannedProducts: ScannedProducts);
      obj.userID = authID;
      var userroutine = obj.UserRoutines.map((e) => RoutineModel(
          RoutineName: e.RoutineName,
          listofproducts: e.listofproducts
              .map((p) => RoutineProductsModel(
                  productname: p.productname,
                  category: p.category,
                  days: p.days))
              .toList())).toList();

      var scannedProd = obj.ScannedProducts.map((e) => ScannedProductModel(
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
          userID: obj.userID,
          UserName: obj.UserName,
          UserEmail: obj.UserEmail,
          UserRoutines: userroutine,
          UserFavouriteProducts: obj.UserFavouriteProducts,
          ScannedProducts: scannedProd);

      CollectionReference database =
          FirebaseFirestore.instance.collection('users');
      var test = databaseuser.toJson();
      print(test);
      DocumentReference documentReferencer = database.doc(authID);
      await documentReferencer.set(test).whenComplete(() {
        print("User data added");
      });
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _buildErrorMessage(String text) {
    Fluttertoast.showToast(
        msg: text,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 14);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //sign in with google
  Future signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      final GoogleSignInAuthentication auth = await account!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user!;
      String authID = user.uid;

      List<String> favourite_products = [];
      Routine AMroutine = Routine(RoutineName: "Morning", listofproducts: []);
      Routine PMroutine = Routine(RoutineName: "Night", listofproducts: []);

      List<Routine> routine_list = [];
      routine_list.add(AMroutine);
      routine_list.add(PMroutine);
      List<ScannedProduct> scannedprod_list = [];

      Users obj = Users(
          UserName: account.displayName!,
          UserEmail: account.email,
          UserRoutines: routine_list,
          UserFavouriteProducts: favourite_products,
          ScannedProducts: scannedprod_list);
      obj.userID = authID;
      var userroutine = obj.UserRoutines.map((e) => RoutineModel(
          RoutineName: e.RoutineName,
          listofproducts: e.listofproducts
              .map((p) => RoutineProductsModel(
                  productname: p.productname,
                  category: p.category,
                  days: p.days))
              .toList())).toList();
      var scannedProd = obj.ScannedProducts.map((e) => ScannedProductModel(
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
          userID: obj.userID,
          UserName: obj.UserName,
          UserEmail: obj.UserEmail,
          UserRoutines: userroutine,
          UserFavouriteProducts: obj.UserFavouriteProducts,
          ScannedProducts: scannedProd
          //UserFavouriteProducts: obj.UserFavouriteProducts
          );

      CollectionReference database =
          FirebaseFirestore.instance.collection('users');
      var test = databaseuser.toJson();
      print(test);
      DocumentReference documentReferencer = database.doc(authID);
      await documentReferencer.set(test).whenComplete(() {
        print("User data added");
      });
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}
