import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/product_categories_feature/product_categories_utilities.dart';
import 'package:skin_scan/product_categories_feature/product_detail.dart';
import 'package:skin_scan/product_categories_feature/product_filter.dart';
import 'package:skin_scan/utilities/utility.dart';

import '../main.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryTitle;
  const CategoryProducts({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  final List<DisplayProducts> ProductsLists = [];

  void initState() {
    super.initState();
    ProductsLists.add(DisplayProducts(
        productImage: 'assets/serumbottle.png',
        productName: "Paula's Choice",
        price: 2000));
    //SizedBox(height: displayHeight(context) * 0.02)

    ProductsLists.add(DisplayProducts(
        productImage: 'assets/serumbottle.png',
        productName: "CoNatural",
        price: 1500));
    //SizedBox(height: displayHeight(context) * 0.02),
    ProductsLists.add(DisplayProducts(
        productImage: 'assets/serumbottle.png',
        productName: "Niacis",
        price: 2500));
    //SizedBox(height: displayHeight(context) * 0.02),
    ProductsLists.add(DisplayProducts(
        productImage: 'assets/serumbottle.png',
        productName: "Acne Serum",
        price: 2080));
    ProductsLists.add(DisplayProducts(
        productImage: 'assets/serumbottle.png',
        productName: "Acne Serum",
        price: 2080));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDetails(screenName: widget.categoryTitle),
        backgroundColor: Color(0xFFFFFDF4),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: displayHeight(context) * 0.02),
                SearchandFilter(),
                SizedBox(height: displayHeight(context) * 0.01),
                Padding(
                  padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.02,
                      left: displayWidth(context) * 0.04),
                  child: Rambla_Green_Italic(
                    textValue: 'Found 13 results',
                    size: displayWidth(context) * 0.03,
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.02),

                Expanded(
                  child: GridView.count(
                    childAspectRatio:
                    displayWidth(context) / displayHeight(context) * 1.3,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    children: List.generate(
                        ProductsLists.length,
                            (index) => DisplayProducts(
                            productImage: ProductsLists[index].productImage,
                            productName: ProductsLists[index].productName,
                            price: ProductsLists[index].price)),
                  ),
                )
                //] )
              ]),
        ));
  }
}

class SearchandFilter extends StatefulWidget {
  const SearchandFilter({Key? key}) : super(key: key);

  @override
  _SearchandFilterState createState() => _SearchandFilterState();
}

class _SearchandFilterState extends State<SearchandFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
            child: TextField(
                autofocus: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Search for a product',
                  hintStyle: GoogleFonts.rambla(
                      color: Color(0xff283618),
                      fontSize: displayHeight(context) * 0.025,
                      fontStyle: FontStyle.italic),
                  fillColor: Color(0xffDADBC6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                          width: displayWidth(context) * 0.03,
                          style: BorderStyle.solid)),
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),

                  contentPadding: EdgeInsets.all(displayHeight(context) * 0.01),

                  suffixIcon: Icon(Icons.search),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: displayWidth(context) * 0.03),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffDADBC6),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Filter(),
                      ));
                },
                icon: Image.asset('assets/filter.png',
                    height: displayHeight(context) * 0.05,
                    width: displayWidth(context) * 0.05,
                    fit: BoxFit.fill),
                color: Color(0xff283618)),
          ),
        )
      ],
    );
  }
}

class DisplayProducts extends StatefulWidget {
  final String productImage;
  final String productName;
  final int price;

  const DisplayProducts(
      {Key? key,
        required this.productImage,
        required this.productName,
        required this.price})
      : super(key: key);

  @override
  _DisplayProductsState createState() => _DisplayProductsState();
}

class _DisplayProductsState extends State<DisplayProducts> {
  late int _rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: InkWell(
          child: Card(
              elevation: 2,
              color: Color(0xffBFC2A4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.25,
                    ),
                    child: FavouriteButton(),
                  ),
                  Image(
                      image: AssetImage(widget.productImage),
                      fit: BoxFit.fill,
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.1),
                  SizedBox(height: displayHeight(context) * 0.005),
                  ReemKufi_Green(
                      textValue: widget.productName,
                      size: displayHeight(context) * 0.025),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rating(),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rambla_Green_Italic(
                      textValue: widget.price.toString() + ' PKR',
                      size: displayHeight(context) * 0.025),
                ],
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  productImage: widget.productImage,
                  productName: widget.productName,
                  productPrice: widget.price,
                ),
              ),
            );
          },
        ));
  }
}