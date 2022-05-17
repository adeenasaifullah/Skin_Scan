import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../entities/product_entities.dart';
import '../models/product_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Product> searchProductList = [];
  List<Product> filteredList = [];
  List<Product> get search => searchProductList;
  bool isFilter = false;
  String dropdownvalue = 'No filter';
  List<Product> searchBarList = [];

  void makeCopy(List<Product> categoryProductList) {
    searchProductList.clear();
    searchProductList.addAll(categoryProductList);
    print(searchProductList);
    notifyListeners();
  }

  void searchBar(String searchText, List<Product> categoryProductList) {
    searchBarList.clear();
    //makeCopy(categoryTitle);

    print("search product list is ${categoryProductList.length}");
    for (int i = 0; i < categoryProductList.length; i++) {
      if (categoryProductList[i].productName.toLowerCase().contains(searchText)) {
        searchBarList.add(categoryProductList[i]);
        print("In the list we have added ${categoryProductList[i].productName}");
        //print("In the product list we had ${categoryProductList[i].productName}");
      }
          }
    for(int j=0; j <searchBarList.length; j++){
      print("The search bar list contains ${searchBarList[j].productName}");

    }
    notifyListeners();
  }

  String changeDropDownValue(String value) {
    dropdownvalue = value;
    return dropdownvalue;
  }

  void filterAccToPrice(String value) {
    filteredList.clear();
    setIsFilter();

    if (value.contains('<=3000')) {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) <= 3000) {
          filteredList.add(product);
          print(product.productName);
        }
      }
      print(filteredList);
    } else if (value.contains('>3000 & <=5000')) {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) > 3000 &&
            int.parse(product.productPrice) <= 5000) {
          filteredList.add(product);
        }
      }
      print(filteredList);
    } else {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) > 5000) {
          filteredList.add(product);
          print(product.productName);
        }
      }
      print(filteredList);
    }
    notifyListeners();
  }

  setIsFilter() {
    isFilter = true;
    notifyListeners();
  }

  List<Product> getFilteredList() {
    notifyListeners();
    return filteredList;
  }

}
