import 'package:skin_scan/models/ingredient_model.dart';

class ScannedProductModel{

  String productName;
  List<IngredientModel> ingredientList;

  ScannedProductModel({
    required this.productName,
    required this.ingredientList
  });

  static fromJson(Map<String, dynamic> json) {
    return ScannedProductModel(
        productName: json['name'],
        ingredientList: (json['ingredientList'] as List).map((e) => IngredientModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> scannedProduct = {};
    scannedProduct['name'] = productName;
    scannedProduct['ingredientList'] = ingredientList.map((v) => v.toJson()).toList();
    return scannedProduct;
  }

}
