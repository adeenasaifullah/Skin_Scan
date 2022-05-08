class ProductModel {
  String productBrand;
  String nameOfCategory;
  String productDescription;
  String howToUse;
  String productIngredients;
  String productName;
  String productPrice;
  String skinType;
  num productRating;

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

// toJson(){
//     return{
//     'Brand':productBrand,
//     'Category' : nameOfCategory,
//     'Description': productDescription,
//     'Ingredients': productIngredients,
//     'Price': productPrice,
//     'Name': productName,
//     'Skin Type': skinType,
//     'How to use' howToUse,
//     'Rating' :productRating
//     };
// }
}
