import 'package:skin_scan/models/product_model.dart';
import 'package:skin_scan/entities/routine_entities.dart';
import 'routine_model.dart';
import '../entities/product_entities.dart';

class UserModel {
  var userID;
  final String UserName;
  final String UserEmail;
  //String UserPassword;
  List<RoutineModel> UserRoutines = [];
  List<String> UserFavouriteProducts = [];


  UserModel({
    required this.userID,
    required this.UserName,
    required this.UserEmail,
    required this.UserRoutines,
    required this.UserFavouriteProducts
  }  );



  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['uid'],
      UserEmail: json['Email'],
      UserName: json['UserName'],
      UserRoutines: (json['Routines'] as List).map((e) => RoutineModel.fromJson(e as Map<String, dynamic>)).toList(),
      UserFavouriteProducts: List.from(json['FavouriteProducts']),
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



    return data;
  }


}


class AuthenticateUser{
  final String userID;

  AuthenticateUser({
    required this.userID
  });
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

      //uid: json['uid'],
      name: json['name'],
    );
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    //data['uid'] = this.uid;
    data['name'] = this.name;


    return data;
  }
}



