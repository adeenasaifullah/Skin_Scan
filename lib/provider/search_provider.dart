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


  void makeCopy(List<Product> categoryProductList) {
    searchProductList.clear();
    searchProductList.addAll(categoryProductList);
    print(searchProductList);
    notifyListeners();
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
    }

    else if (value.contains('>3000 & <=5000')) {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) > 3000 && int.parse(product.productPrice) <= 5000) {
          filteredList.add(product);
        }
      }
      print(filteredList);
    }
    else {
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

  String changeDropDownValue(String value) {
    dropdownvalue = value;
    notifyListeners();
    return dropdownvalue;
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
