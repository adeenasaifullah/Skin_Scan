import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../product_categories_feature/categories_list.dart';
import '../routine_feature/routine_feature_utilities.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categoriesList = [];

  //CategoryProvider({required Create<ChangeNotifier?> create}) : super(create: create);

  int getCategoryLength() {
    int length = categoriesList.length;
    return length;
  }

  List<Category> getCategories() {
    return categoriesList;
  }

  Future getCategoriesFromDb() async {
    //categoriesList == null ?

    categoriesList.clear();
    //categoriesList=[];
    // mytasks.clear()

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
    print('category list ${categoriesList}');
  }
}
