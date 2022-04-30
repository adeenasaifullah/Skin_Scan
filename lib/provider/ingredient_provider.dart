import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import '../Models/ingredient_model.dart';

class IngredientProvider extends ChangeNotifier {

  //late Ingredient ingredient ;
  List<Ingredient> ingredientList = [];

  Future getIngredientInfo(String alphabet, String findIngredient) async {
    //print("here");
    //productsList.clear();
    String collectionName = alphabet.toLowerCase() + "_ingredient";
    //print("CollectionName: " + collectionName);
    await FirebaseFirestore.instance
        .collection(collectionName)
        .limit(1)
        .where('name', isEqualTo: findIngredient)
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
        //print(ingredient.ingredientName);
        //print(ingredient.ingredientRating);
        //print(ingredient.ingredientDescription);
        //print(ingredient.ingredientCategory);
      });
    });
    notifyListeners();
    //print("here now");
    //return ingredient;
  }

}