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
          productImage: productModel.productImage,
          productIngredients: productModel.productIngredients,
        );
        product.prodID = doc.id;

        productsList.add(product);
      });
    });
    notifyListeners();
  }

  List<Product> getProductsOfCategory(String name) {
    List<Product> productsOfCategory = [];

    for (int i = 0; i < productsList.length; i++) {
      if (productsList[i].nameOfCategory == name) {
        productsOfCategory.add(productsList[i]);
      }
    }
    return productsOfCategory;
  }

  int getProductListLength() {
    int length = productsList.length;
    return length;
  }

  void updateRating(Product product, double userRating) async {
    userRating = (userRating + product.productRating) / 2;
    product.productRating = userRating;
    updateRatinginDB(product);
    notifyListeners();
  }

  Future<void> updateRatinginDB(Product product) async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    ProductModel prod = ProductModel(
        prodID: product.prodID,
        nameOfCategory: product.nameOfCategory,
        skinType: product.skinType,
        productPrice: product.productPrice,
        productIngredients: product.productIngredients,
        productImage: product.productImage,
        productDescription: product.productDescription,
        howToUse: product.howToUse,
        productName: product.productName,
        productRating: product.productRating,
        productBrand: product.productBrand);

    await products
        .doc(prod.prodID)
        .update(prod.toJson())
        .whenComplete(() => print('rating updated'));
    notifyListeners();
  }
}
