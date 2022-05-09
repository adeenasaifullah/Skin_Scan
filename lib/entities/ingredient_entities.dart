class Ingredient {
  String ingredientName;
  String ingredientRating;
  String ingredientCategory;
  String ingredientDescription;

  Ingredient({
    required this.ingredientName,
    required this.ingredientRating,
    required this.ingredientCategory,
    required this.ingredientDescription,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ingredient = {};
    ingredient['name'] = ingredientName;
    ingredient['rating'] = ingredientRating;
    ingredient['categories'] = ingredientCategory;
    ingredient['description'] = ingredientDescription;
    return ingredient;
  }

}