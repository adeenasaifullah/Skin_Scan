import 'package:skin_scan/models/product_model.dart';
import 'package:skin_scan/entities/routine_entities.dart';
import 'package:skin_scan/models/scanned_product_model.dart';
import 'routine_model.dart';
import '../entities/product_entities.dart';

class UserModel {
  var userID;
  final String UserName;
  final String UserEmail;
  List<RoutineModel> UserRoutines = [];
  List<String> UserFavouriteProducts = [];
  List<ScannedProductModel> ScannedProducts = [];

  UserModel(
      {required this.userID,
      required this.UserName,
      required this.UserEmail,
      required this.UserRoutines,
      required this.UserFavouriteProducts,
      required this.ScannedProducts});

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['uid'],
      UserEmail: json['Email'],
      UserName: json['UserName'],
      UserRoutines: (json['Routines'] as List)
          .map((e) => RoutineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      UserFavouriteProducts: List.from(json['FavouriteProducts']),
      ScannedProducts: (json['Scanned Products'] as List)
          .map((e) => ScannedProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),

      //UserFavouriteProducts: List.from(json['FavouriteProducts'])
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.userID;
    data['UserName'] = this.UserName;
    data['Email'] = this.UserEmail;
    data['Routines'] = this.UserRoutines.map((v) => v.toJson()).toList();
    data['FavouriteProducts'] = List.of(this.UserFavouriteProducts);
    data['Scanned Products'] = this.ScannedProducts.map((e) => e.toJson()).toList();
    return data;
  }
}

class AuthenticateUser {
  final String userID;
  final String email;
  final String name;

  AuthenticateUser(
      {required this.userID, required this.email, required this.name});
}

class UserProfile {
  //String uid;
  String name;

  UserProfile({
    //required this.uid,
    required this.name,
  });

  static fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    return data;
  }
}
