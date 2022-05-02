


import 'package:skin_scan/entities/routine_product_entities.dart';

class Routine {
  var RoutID;
  final String RoutineName;
  List<RoutineProducts> listofproducts = [];
  //final String time;
  int numofproducts = 0;


  Routine({
    required this.RoutineName, required this.listofproducts,
    });


  static Routine fromJson(Map<String, dynamic> json) {
    return Routine(
      RoutineName: json['RoutineName'],
      listofproducts:
      (json['RoutineProducts'] as List).map((e) => RoutineProducts.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

}