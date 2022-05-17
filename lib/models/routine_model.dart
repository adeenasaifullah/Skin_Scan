import 'package:skin_scan/models/routine_product_model.dart';

class RoutineModel{

  final String RoutineName;
  List<RoutineProductsModel> listofproducts = [];


  RoutineModel({
    required this.RoutineName,
    required this.listofproducts,
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