import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product_categories_feature/categories_list.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categoriesList = [];

  int getCategoryLength() {
    int length = categoriesList.length;
    return length;
  }

  List<Category> getCategories() {
    return categoriesList;
  }

  Future getCategoriesFromDb() async {
    categoriesList.clear();

    await FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Category category =
            Category.fromJson(doc.data() as Map<String, dynamic>);
        category.catID = doc.id;
        categoriesList.add(category);
      });
    });
    notifyListeners();

  }
}
