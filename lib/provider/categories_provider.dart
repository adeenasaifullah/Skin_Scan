import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product_categories_feature/categories_list.dart';
import '../routine_feature/routine_feature_utilities.dart';

class CategoryProvider extends ChangeNotifier {

  List<Category> categoriesList = [];
  Future<void> getCategoriesFromDb() async {

    // mytasks.clear();
    FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Category category = Category.fromJson(doc.data() as Map<String, dynamic>);
        categoriesList.add(category);
      });
      notifyListeners();
    });
  }
}