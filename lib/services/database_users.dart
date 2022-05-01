import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/users_model.dart';

class Database{
  final String uid;
  Database({required this.uid});

  //collecion reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('usersDemo');
  Future updateUserData({required String userName}) async
  {
    DocumentReference documentReferencer = userCollection.doc(uid);

    UserProfile user = UserProfile(
      uid: uid,
      name: userName,
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

