

import 'package:skin_scan/entities/routine_entities.dart';

class Users{


  var userID;
  final String UserName;
  final String UserEmail;
  //String UserPassword;
  List<Routine> UserRoutines = [];
  // final List<Product> UserFavoritedProducts;

  Users({required this.UserName, required this.UserEmail, required this.UserRoutines}  );





}