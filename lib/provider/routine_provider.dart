import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routine_feature/routine_feature_utilities.dart';


class RoutineProvider extends ChangeNotifier {
  List<Routine> routine_list = [];

  RoutineProvider() {
    List<String> productdays = ["Monday", "Wednesday", "Friday", "Sunday"];
    Product AMproduct1 = Product(
        productname: "Caquina Moisturizer",
        category: "Moisturizer",
        days: ["Monday", "Wednesday", "Friday", "Sunday"]);

    Product AMproduct2 = Product(
        productname: "Caquina Toner", category: "Toner", days: productdays);
    Product AMproduct3 = Product(
        productname: "Clarins Sunscreen",
        category: "Sunscreen",
        days: productdays);

    Routine AMroutine = Routine(RoutineName: "Morning Routine", time: "AM");

    AMroutine.listofproducts.add(AMproduct1);
    AMroutine.listofproducts.add(AMproduct2);
    AMroutine.listofproducts.add(AMproduct3);
    AMroutine.numofproducts = AMroutine.listofproducts.length;
    routine_list.add(AMroutine);

    Product PMproduct1 = Product(
        productname: "CeraVe Moisturizer",
        category: "Moisturizer",
        days: productdays);
    Product PMproduct2 = Product(
        productname: "Caquina Phool Proof",
        category: "Toner",
        days: productdays);
    Product PMproduct3 = Product(
        productname: "The Ordinary Vit C",
        category: "Serum",
        days: productdays);
    Product PMproduct4 = Product(
        productname: "Paula's Choice BHA Solution",
        category: "Exfoliator",
        days: productdays);

    Routine PMroutine = Routine(RoutineName: "Night Routine", time: "PM");
    PMroutine.listofproducts.add(PMproduct1);
    PMroutine.listofproducts.add(PMproduct2);
    PMroutine.listofproducts.add(PMproduct3);
    PMroutine.listofproducts.add(PMproduct4);
    PMroutine.numofproducts = PMroutine.listofproducts.length;
    routine_list.add(PMroutine);
  }

  Future<void> addroutine(String name, String time) async {
    Routine newroutine = Routine(RoutineName: name, time: time);
    routine_list.add(newroutine);
    notifyListeners();
  }

  Future<void> addproductToRoutine(Routine x, Product P) async {
    int index = routine_list
        .indexWhere((routine) => routine.RoutineName == x.RoutineName);
    routine_list[index].listofproducts.add(P);
    routine_list[index].numofproducts = routine_list[index].numofproducts + 1;
    notifyListeners();
  }
}