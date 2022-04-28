import 'package:firebase_auth/firebase_auth.dart';
import 'package:skin_scan/Models/users_model.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;



  //create user object based on firebase user
  UserProfile? _userFromFirebaseUser(User? user){
    return user!=null ? UserProfile(userID: user.uid) : null;
  }
//   Users _userFromUser(User user){
//   return  user!= null ? Users(userID: user.userID) : null;
// }
Stream<UserProfile?> get user {
    return _auth.authStateChanges().map((User? user)=> _userFromFirebaseUser(user));
}


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {

      return e;
    }
  }



  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Account Created";
    }
    on FirebaseAuthException catch(e){
      return e.message;
    }

  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }
  //sign in with google
  // Future signInWithGoogle() async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? account = await googleSignIn.signIn();
  //     final GoogleSignInAuthentication auth = await account!.authentication;
  //
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: auth.accessToken,
  //       idToken: auth.idToken,
  //     );
  //     UserCredential result = await _auth.signInWithCredential(credential);
  //     User user = result.user!;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return e;
  //   }
  // }
}









