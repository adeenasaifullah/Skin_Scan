import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Models/routine_model.dart';
import '../Models/routine_product_model.dart';
import '../entities/routine_entities.dart';
import '../entities/user_entities.dart';
import 'package:skin_scan/Models/users_adeena_model.dart';


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
      print(email);
      print(password);
      User user = result.user!;
      String authID = user.uid;

      // String name = (user.displayName!);
      // print(user.displayName);
      // print(name);

      //DocumentReference documentReferencer = userCollection.doc(uid);
      Routine AMroutine = Routine(RoutineName: "Morning", listofproducts: []);
      Routine PMroutine = Routine(RoutineName: "Night", listofproducts: []);

      List<Routine> routine_list = [];
      routine_list.add(AMroutine);
      routine_list.add(PMroutine);

      Users obj = Users(
          //uid: uid,

          UserName: "Hello",
          UserEmail: email,
          UserRoutines: routine_list
          //routine_list.map((e) => e.toJson()).toList();
          //this.UserRoutines.map((v) => v.toJson()).toList();

          );
      obj.userID = authID;
            var userroutine = obj.UserRoutines.map((e) => RoutineModel(
          RoutineName: e.RoutineName,
          listofproducts: e.listofproducts
              .map((p) => RoutineProductsModel(
                  productname: p.productname,
                  category: p.category,
                  days: p.days))
              .toList())).toList();
      UserModel databaseuser = UserModel(
          userID: obj.userID,
          UserName: obj.UserName,
          UserEmail: obj.UserEmail,
          UserRoutines: userroutine);

      CollectionReference database =
          FirebaseFirestore.instance.collection('users');
      var test = databaseuser.toJson();
      print(test);
      DocumentReference documentReferencer = database.doc(authID);
      await documentReferencer.set(test).whenComplete(() {
        print("User data added");
      });
      //DocumentReference docref = await database.add(test);

      //databaseuser.userID = authID;

      //await Database(uid: user.uid).storeUserData(name: user.displayName!, email: user.email!);
      return _userFromFirebaseUser(user);
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

