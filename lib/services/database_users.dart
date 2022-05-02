import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/users_adeena_model.dart';


class Database{
  final String uid;
  final String name;
  final String email;
  Database({required this.uid, required this.email, required this.name});

  //collecion reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('usersDemo');
  Future updateUserData({required String userName}) async
  {
    DocumentReference documentReferencer = userCollection.doc(uid);

    UserModel user = UserModel(
      //uid: uid,
      userID: uid,
      UserName: userName,
      UserEmail: '',
      UserRoutines: []
       );

    var data = user.toJson();

    await documentReferencer.set(data).whenComplete(() {
      print("User data added");
    }).catchError((e) => print(e));
  }
  Stream<QuerySnapshot> retrieveUsers(){
    Stream<QuerySnapshot> queryUsers = userCollection
        .orderBy('last_seen', descending: true)
        .snapshots();

    return queryUsers;
  }

}

