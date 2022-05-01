import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skin_scan/Models/users_model.dart';

import 'database_users.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  AuthenticateUser? _userFromFirebaseUser(User? user) {
    return user != null ? AuthenticateUser(userID: user.uid) : null;
  }

//   Users _userFromUser(User user){
//   return  user!= null ? Users(userID: user.userID) : null;
// }
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
      //print(email);
      User user = result.user!;
      await Database(uid: user.uid).updateUserData(userName: 'newMember');
      return _userFromFirebaseUser(user);
      //await _auth.createUserWithEmailAndPassword(email: email, password: password);


    } catch (e) {
      //Fluttertoast.showToast(msg: e!.message);
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

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
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
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }

  }
}
// final  messengerKey = GlobalKey<ScaffoldMessengerState>();
// class Utils{
//
//    static showSnackBar(String? text){
//     if(text == null) return;
//
//     final snackBar = showSnackBar(
//       text = text,
//     );
//     messengerKey.
//     currentState!..
//     removeCurrentSnackBar()..
//     showSnackBar(snackBar);
//
//   }
// }




