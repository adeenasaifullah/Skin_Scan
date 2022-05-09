import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/models/ingredient_model.dart';
import 'package:skin_scan/models/scanned_product_model.dart';

import '../entities/scanned_product_entities.dart';

class ScannedProductProvider extends ChangeNotifier {
  List<ScannedProduct> productList = [];

  Future getScannedProduct() async {
    productList.clear();
    await FirebaseFirestore.instance
        .collection('scanned_product')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ScannedProductModel productModel =
            ScannedProductModel.fromJson(doc.data() as Map<String, dynamic>);
        List<Ingredient> ingredientList = productModel.ingredientList
            .map((e) => Ingredient(
                ingredientName: e.ingredientName,
                ingredientRating: e.ingredientRating,
                ingredientCategory: e.ingredientCategory,
                ingredientDescription: e.ingredientDescription))
            .toList();
        ScannedProduct product = ScannedProduct(
            productName: productModel.productName,
            ingredientList: ingredientList);
        productList.add(product);
      });
    });
    notifyListeners();
  }

  Future storeScannedProduct(ScannedProduct product) async {
    List<IngredientModel> ingredient = product.ingredientList
        .map((e) => IngredientModel(
            ingredientName: e.ingredientName,
            ingredientRating: e.ingredientRating,
            ingredientCategory: e.ingredientCategory,
            ingredientDescription: e.ingredientDescription))
        .toList();
    ScannedProductModel productModel = ScannedProductModel(
        productName: product.productName, ingredientList: ingredient);
    CollectionReference database =
        FirebaseFirestore.instance.collection('scanned_product');
    database.add(productModel.toJson());
    notifyListeners();
  }
}
