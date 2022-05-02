class RoutineProducts {
  var RoutProdID;
  final String productname;
  final String category;
  List<String> days = [];


  RoutineProducts(
      {
        required this.productname,
        required this.category,
        required this.days});





  static RoutineProducts fromJson(Map<String, dynamic> json) {
    return RoutineProducts(
        category: json['Category'],
        productname: json ['ProductName'],
        days: List.from(json['Days'])

    );
  }





}