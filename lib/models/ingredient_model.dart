class IngredientModel{
  String ingredientName;
  String ingredientRating;
  String ingredientCategory;
  String ingredientDescription;

  IngredientModel({
    required this.ingredientName,
    required this.ingredientRating,
    required this.ingredientCategory,
    required this.ingredientDescription,
  });

  static fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      ingredientName: json['name'],
      ingredientRating: json['rating'],
      ingredientCategory: json['categories'],
      ingredientDescription: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> ingredient = {};
    ingredient['name'] = ingredientName;
    ingredient['rating'] = ingredientRating;
    ingredient['categories'] = ingredientCategory;
    ingredient['description'] = ingredientDescription;
    return ingredient;
  }
}