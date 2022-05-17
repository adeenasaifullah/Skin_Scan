import 'package:skin_scan/entities/routine_product_entities.dart';

class Routine {
  var RoutID;
  final String RoutineName;
  List<RoutineProducts> listofproducts = [];
  int numofproducts = 0;

  Routine({
    required this.RoutineName,
    required this.listofproducts,
  });
}
