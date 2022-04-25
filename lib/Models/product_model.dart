class ProductModel{
  final String productBrand;
  final String nameOfCategory;
  final String productDescription;
  final String howToUse;
  final String productIngredients;
  final String productName;
  final String productPrice;
  final String skinType;
  final int productRating;


  ProductModel({
    required this.productBrand,
    required this.nameOfCategory,
    required this.productDescription,
    required this.howToUse,
    required this.productIngredients,
    required this.productName,
    required this.productPrice,
    required this.skinType,
    required this.productRating,

  });

  static fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productBrand: json['Brand'],
      nameOfCategory: json['Category'],
      productDescription: json['Description'],
      productIngredients: json['Ingredients'],
      productPrice: json['Price'],
      productName: json['Name'],
      skinType: json['Skin Type'],
      howToUse: json['How to use'],
      productRating: json['Rating'],

    );
  }
}