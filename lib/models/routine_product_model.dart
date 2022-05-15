import 'package:flutter/foundation.dart';

class RoutineProductsModel {

  final String productname;
  final String category;
  List<String> days = [];


  RoutineProductsModel(
      {
        required this.productname,
        required this.category,
        required this.days});


    //JSON METHOD HERE

  static RoutineProductsModel fromJson(Map<String, dynamic> json) {
    return RoutineProductsModel(
        category: json['Category'],
        productname: json ['ProductName'],
      days: List.from(json['Days'])

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['ProductName'] = this.productname;
    data['Days'] = List.of(this.days);
    return data;
  }

}