class Product {
  var prodID;
   String productBrand;
   String nameOfCategory;
   String productDescription;
   String howToUse;
   String productIngredients;
   String productName;
   String productPrice;
   String skinType;
   String productImage;
   num productRating;
   String productImage;

  Product({
    required this.productBrand,
    required this.nameOfCategory,
    required this.productDescription,
    required this.howToUse,
    required this.productIngredients,
    required this.productName,
    required this.productPrice,
    required this.skinType,
    required this.productImage,
    required this.productRating,
    required this.productImage
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Brand'] = productBrand;
    data['Category'] = nameOfCategory;
    data['Description'] = productDescription;
    data['Ingredients'] = productIngredients;
    data['Price'] = productPrice;
    data['Name'] = productName;
    data['Skin Type'] = skinType;
    data['How to use'] = howToUse;
    data['Image'] = productImage;
    data['Rating'] = productRating;
    data['Image'] = productImage;
    return data;
  }
}