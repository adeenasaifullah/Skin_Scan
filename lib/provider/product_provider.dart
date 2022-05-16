import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../entities/product_entities.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsList = [];
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  List<Product> get getProducts => productsList;

  Future getProductsFromDatabase() async {
    productsList.clear();
    await products.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ProductModel productModel =
            ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        Product product = Product(
          productName: productModel.productName,
          productDescription: productModel.productDescription,
          howToUse: productModel.howToUse,
          productBrand: productModel.productBrand,
          productRating: productModel.productRating,
          productPrice: productModel.productPrice,
          skinType: productModel.skinType,
          nameOfCategory: productModel.nameOfCategory,
          productIngredients: productModel.productIngredients,

        );
        product.prodID = doc.id;
        productsList.add(product);
      });
    });
    //print('hello product list $productsList');
    notifyListeners();
  }



  List<Product> getProductsOfCategory(String name) {
    List<Product> productsOfCategory = [];

    for (int i = 0; i < productsList.length; i++) {
      //print('snoop');
      if (productsList[i].nameOfCategory == name) {
        productsOfCategory.add(productsList[i]);
      }
    }
    print("get category products + $productsOfCategory");
    return productsOfCategory;
  }



  int getProductListLength() {
    int length = productsList.length;
    return length;
  }

  void updateRating(Product product, double userRating) async {
    userRating = (userRating + product.productRating) / 2;

    product.productRating = userRating;
    print(product.productRating);

    updateRatinginDB(product);
    notifyListeners();
  }

  Future<void> updateRatinginDB(Product product) async {

    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    await products
        .doc(product.prodID)
        .update(product.toJson())
        .whenComplete(() => print('rating updated'));
    notifyListeners();
  }
}
