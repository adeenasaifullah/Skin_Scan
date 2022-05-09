import 'ingredient_entities.dart';

class ScannedProduct{
  String productName;
  List<Ingredient> ingredientList;

  ScannedProduct({
    required this.productName,
    required this.ingredientList
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> scannedProduct = {};
    scannedProduct['name'] = productName;
    scannedProduct['ingredientList'] = ingredientList.map((v) => v.toJson()).toList();
    return scannedProduct;
  }
}