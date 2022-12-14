import 'package:skin_scan/Models/routine_product_model.dart';

import '../entities/routine_entities.dart';
import '../entities/routine_product_entities.dart';

class RoutineModel{

  final String RoutineName;
  List<RoutineProductsModel> listofproducts = [];
 // final String time;
  int numofproducts = 0;

  RoutineModel({
    required this.RoutineName,
    //required this.time,
  required this.listofproducts,
 // required this.numofproducts
  });



  static RoutineModel fromJson(Map<String, dynamic> json) {
    return RoutineModel(
      RoutineName: json['RoutineName'],
      listofproducts:
      (json['RoutineProducts'] as List).map((e) => RoutineProductsModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RoutineName'] = this.RoutineName;
    data['RoutineProducts'] = this.listofproducts.map((v) => v.toJson()).toList();
    return data;
  }


}