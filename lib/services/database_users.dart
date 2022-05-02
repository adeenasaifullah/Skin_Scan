// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../Models/routine_model.dart';
// import '../Models/users_adeena_model.dart';
// import '../entities/routine_entities.dart';
// import '../entities/routine_product_entities.dart';
// import '../entities/user_entities.dart';
//
//
// class Database{
//    final String uid;
//   // final String name;
//   // final String email;
//   Database({required this.uid});
//
//   //collecion reference
//   final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
//   Future updateUserData({required String name, required String email}) async
//   {
//     DocumentReference documentReferencer = userCollection.doc(uid);
//     Routine AMroutine = Routine(RoutineName: "Morning", listofproducts: []);
//     Routine PMroutine = Routine(RoutineName: "Night", listofproducts: []);
//
//     List<Routine> routine_list = [];
//     routine_list.add(AMroutine);
//     routine_list.add(PMroutine);
//
//
//     // UserProfile user = UserProfile(
//     //  name: name,
//     //
//     // );
//
//     Users user = Users(
//       //uid: uid,
//
//       UserName: ,
//       UserEmail: ,
//       UserRoutines: routine_list
//       //routine_list.map((e) => e.toJson()).toList();
//         //this.UserRoutines.map((v) => v.toJson()).toList();
//
//        );
//
//
//     var data = user.toJson();
//
//     await documentReferencer.set(data).whenComplete(() {
//       print("User data added");
//     }).catchError((e) => print(e));
//   }
//   Stream<QuerySnapshot> retrieveUsers(){
//     Stream<QuerySnapshot> queryUsers = userCollection
//         .orderBy('last_seen', descending: true)
//         .snapshots();
//
//     return queryUsers;
//   }
//
// }
//
