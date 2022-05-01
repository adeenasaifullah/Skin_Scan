import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import '../Models/ingredient_model.dart';

class IngredientProvider extends ChangeNotifier {

  List<Ingredient> ingredientList = [];

  Future getIngredientInfo(String findIngredient) async {
    ingredientList.clear();
    String modifiedIngredient = titleCase(findIngredient);
    //print("Modified:" + modifiedIngredient);
    String collectionName = findIngredient.substring(0,1).toLowerCase() + "_ingredient";
    //print("CollectionName: " + collectionName);
    await FirebaseFirestore.instance
        .collection(collectionName)
        .limit(1)
        .where('name', whereIn: [findIngredient.toLowerCase(),findIngredient.toUpperCase(),modifiedIngredient.trim(),findIngredient])
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        IngredientModel ingredientModel =
        IngredientModel.fromJson(doc.data() as Map<String, dynamic>);
        Ingredient ingredient = Ingredient(
            ingredientName: ingredientModel.ingredientName,
            ingredientRating: ingredientModel.ingredientRating,
            ingredientCategory: ingredientModel.ingredientCategory,
            ingredientDescription: ingredientModel.ingredientDescription
        );
        ingredientList.add(ingredient);
        // print(ingredient.ingredientName);
        // print(ingredient.ingredientRating);
        // print(ingredient.ingredientDescription);
        // print(ingredient.ingredientCategory);
      });
    });
    notifyListeners();
  }

  String titleCase(String ingredient){
    String changeIngredient = "";
    List<String> arr = ingredient.split(" ");
    for(var word in arr){
      changeIngredient = changeIngredient + word.substring(0,1).toUpperCase();
      changeIngredient = changeIngredient + word.substring(1) + " " ;
    }
    //print(changeIngredient);
    return changeIngredient;
  }

}