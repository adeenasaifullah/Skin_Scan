import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/Models/routine_product_model.dart';
import 'package:skin_scan/entities/routine_entities.dart';


import '../Models/routine_model.dart';
import '../Models/users_adeena_model.dart';
import '../entities/routine_product_entities.dart';
import '../entities/user_entities.dart';

class UserProvider extends ChangeNotifier
{

final List<Users> allUsers = [];
Future getUsersfromDB() async {
  await
  FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
  querySnapshot.docs.forEach((doc) {
  UserModel newuser= UserModel.fromJson(doc.data() as Map<String, dynamic>);
  newuser.userID = doc.id;
  print(doc.id);
  print(newuser.UserName);
  var routines = newuser.UserRoutines
      .map((e) => Routine(
    RoutineName: e.RoutineName, listofproducts: e.listofproducts.map((p) => RoutineProducts(productname: p.productname,
      category: p.category, days: p.days)).toList())).toList();
  Users user = Users(UserName: newuser.UserName, UserEmail: newuser.UserEmail, UserRoutines: routines);
  user.userID = newuser.userID;
  print(user.UserName);
  print(user.UserRoutines[0].listofproducts[0].days[0]);
  allUsers.add(user);
  print(allUsers[0].UserName);
  notifyListeners();
  });
    notifyListeners();
  });
}

Future<void> storeUserinDB(Users thisuser)
async {
  var userroutine = thisuser.UserRoutines
      .map((e) => RoutineModel(
      RoutineName: e.RoutineName, listofproducts: e.listofproducts.map((p) => RoutineProductsModel(productname: p.productname,
      category: p.category, days: p.days)).toList())).toList();
  UserModel databaseuser = UserModel(userID: thisuser.userID,UserName: thisuser.UserName, UserEmail: thisuser.UserEmail, UserRoutines: userroutine);


  CollectionReference database = FirebaseFirestore.instance.collection('users');
    var test = databaseuser.toJson();
    print(test);
    DocumentReference docref = await database.add(test);
    databaseuser.userID = docref.id;





}
}