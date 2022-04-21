import 'package:flutter/material.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../main.dart';
import 'category_product_list.dart';

class CategoriesAndSearch extends StatefulWidget {
  const CategoriesAndSearch({Key? key}) : super(key: key);

  @override
  _CategoriesAndSearchState createState() => _CategoriesAndSearchState();
}

class _CategoriesAndSearchState extends State<CategoriesAndSearch> {
  late TextEditingController ingredient_controller;

  void initState() {
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
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                          categoryTitle: 'Serums',
                        ),
                      ),
                    );
                  },
                  child: const Category(
                      categoryName: 'Serums',
                      categoryImage: 'assets/serumbottle.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                          categoryTitle: 'Moisturizers',
                        ),
                      ),
                    );
                  },
                  child: const Category(
                      categoryName: 'Moisturizers',
                      categoryImage: 'assets/moisturizerbottle.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                          categoryTitle: 'Toners',
                        ),
                      ),
                    );
                  },
                  child: const Category(
                      categoryName: 'Toners',
                      categoryImage: 'assets/tonerbottle.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                          categoryTitle: 'Suncare',
                        ),
                      ),
                    );
                  },
                  child: const Category(
                      categoryName: 'Suncare',
                      categoryImage: 'assets/Suncare.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                          categoryTitle: 'Masks',
                        ),
                      ),
                    );
                  },
                  child: const Category(
                      categoryName: 'Masks', categoryImage: 'assets/Masks.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                          categoryTitle: 'Exfoliators',
                        ),
                      ),
                    );
                  },
                  child: const Category(
                      categoryName: 'Exfoliators',
                      categoryImage: 'assets/exfoliators.png'),
                )
              ],
            ),
          ),
        ],
      ),

      //  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Category extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  const Category(
      {Key? key, required this.categoryName, required this.categoryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image: AssetImage(categoryImage),
                  fit: BoxFit.contain,
                  height: displayHeight(context) * 0.125,
                  width: displayWidth(context) * 0.25),
              ReemKufi_Green(
                textValue: categoryName,
                size: displayWidth(context) * 0.035,
              ),
            ])
    );
  }
}
