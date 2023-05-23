import 'package:skin_scan/entities/product_entities.dart';
import 'package:skin_scan/entities/routine_entities.dart';
import 'package:skin_scan/entities/scanned_product_entities.dart';

import '../models/product_model.dart';

class Users {
  var userID;
  final String UserName;
  final String UserEmail;
  List<Routine> UserRoutines = [];
  List<String> UserFavouriteProducts = [];
  List<ScannedProduct> ScannedProducts = [];

  Users(
      {required this.UserFavouriteProducts,
      required this.UserName,
      required this.UserEmail,
      required this.UserRoutines,
      required this.ScannedProducts});
}
