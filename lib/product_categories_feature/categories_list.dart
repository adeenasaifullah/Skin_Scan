import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/provider/product_provider.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../main.dart';
import '../provider/categories_provider.dart';
import 'category_product_list.dart';

class CategoriesAndSearch extends StatefulWidget {
  const CategoriesAndSearch({Key? key}) : super(key: key);

  @override
  _CategoriesAndSearchState createState() => _CategoriesAndSearchState();
}

class _CategoriesAndSearchState extends State<CategoriesAndSearch> {
  late TextEditingController ingredient_controller;

  void initState() {
    //context.read<CategoryProvider>().getCategories().clear();

      //context.read<CategoryProvider>().getCategoriesFromDb();



    super.initState();
    ingredient_controller = TextEditingController();
  }



  // void dispose() {
  //   ingredient_controller.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Categories'),
      backgroundColor: const Color(0xFFFFFDF4),

      body: Column(
        children: <Widget>[

          Rambla_Green_Italic(
            textValue: 'Select to browse products by a category',
            size: displayHeight(context) * 0.02,
          ),

          SizedBox(height: displayHeight(context) * 0.03),

          //SizedBox(height: displayHeight(context) * 0.8),
          Expanded(
            child: GridView.builder(
              primary: false,
              padding: const EdgeInsets.all(20),
              itemCount: context.watch<CategoryProvider>().getCategoryLength(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Category(categoryName: context.watch<CategoryProvider>().getCategories()[index].categoryName,
                    categoryImage: context.watch<CategoryProvider>().getCategories()[index].categoryImage
                  // Text(context.watch<CategoryProvider>().getCategories()[index].categoryName)
                  // child: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   //crossAxisAlignment: CrossAxisAlignment.center,
                  //
                  //   children: <Widget>[
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 CategoryProducts(
                  //                   categoryTitle: 'Serums',
                  //                 ),
                  //           ),
                  //         );
                  //       },
                  //       child: Category(
                  //           categoryName: context.watch<CategoryProvider>().categoriesList[index].categoryName,
                  //           categoryImage: 'assets/serumbottle.png'),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 CategoryProducts(
                  //                   categoryTitle: 'Moisturizers',
                  //                 ),
                  //           ),
                  //         );
                  //       },
                  //       child: Category(
                  //           categoryName: context.watch<CategoryProvider>().categoriesList[index].categoryName,
                  //           categoryImage: 'assets/moisturizerbottle.png'),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 CategoryProducts(
                  //                   categoryTitle: 'Toners',
                  //                 ),
                  //           ),
                  //         );
                  //       },
                  //       child: Category(
                  //           categoryName: context.watch<CategoryProvider>().categoriesList[index].categoryName,
                  //           categoryImage: 'assets/tonerbottle.png'),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 CategoryProducts(
                  //                   categoryTitle: 'Suncare',
                  //                 ),
                  //           ),
                  //         );
                  //       },
                  //       child: Category(
                  //           categoryName: context.watch<CategoryProvider>().categoriesList[index].categoryName,
                  //           categoryImage: 'assets/Suncare.png'),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 CategoryProducts(
                  //                   categoryTitle: 'Masks',
                  //                 ),
                  //           ),
                  //         );
                  //       },
                  //       child: Category(
                  //           categoryName: context.watch<CategoryProvider>().categoriesList[index].categoryName,
                  //           categoryImage: 'assets/Masks.png'),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 CategoryProducts(
                  //                   categoryTitle: 'Exfoliators',
                  //                 ),
                  //           ),
                  //         );
                  //       },
                  //       child: Category(
                  //           categoryName: context.watch<CategoryProvider>().categoriesList[index].categoryName,
                  //           categoryImage: 'assets/exfoliators.png'),
                  //     )
                  //   ],
                  // ),
                );

              },
            ),
          ),
        ],
      ),

      //  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Category extends StatelessWidget {
  //List<Category> categoriesList = [];
  final String categoryName;
  final String categoryImage;
  var catID;
  Category(
      {Key? key, required this.categoryName, required this.categoryImage})
      : super(key: key);

  static Category fromJson(Map<String, dynamic> json) => Category(
      categoryName: json['categName'],
    categoryImage: json['categImg'],
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryProducts(
                  categoryTitle: categoryName,
                ),
          ),
        );


      },

      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(0xffDADBC6),
          ),
          width: displayWidth(context) * 0.05,
          height: displayHeight(context) * 0.05,
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: NetworkImage(categoryImage),
                    fit: BoxFit.contain,
                    height: displayHeight(context) * 0.125,
                    width: displayWidth(context) * 0.25, ),
                ReemKufi_Green(
                  textValue: categoryName,
                  size: displayWidth(context) * 0.035,
                ),
              ])
      ),
    );
  }
}
