import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/product_categories_feature/product_detail.dart';

import '../Models/product_model.dart';
import '../entities/product_entities.dart';
import '../product_categories_feature/categories_list.dart';
import '../product_categories_feature/category_product_list.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productsList = [];
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  List<Product> get getProducts => productsList;

  Future getProductsFromDatabase() async {
    productsList.clear();
    await products.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //print(doc.id);
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
    //getProductsFromDatabase();
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
    //CollectionReference products = FirebaseFirestore.instance.collection('products');

    //await products.doc(product.prodID).update(product.toJson()).whenComplete(() => print('rating updated'));
    //await products.doc(product.prodID).update(product.toJson());
    updateRatinginDB(product);
    //double avgRating = (userRating + product.productRating)/2;
    //return userRating;
    notifyListeners();
  }

  Future<void> updateRatinginDB(Product product) async {
    //product.productRating = userRating;

    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    await products
        .doc(product.prodID)
        .update(product.toJson())
        .whenComplete(() => print('rating updated'));
    //await products.doc(product.prodID).update(product.toJson());
    //getProductsFromDatabase();

    //double avgRating = (userRating + product.productRating)/2;
    //return userRating;
    notifyListeners();
  }
}
