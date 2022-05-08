import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/product_categories_feature/product_categories_utilities.dart';
import 'package:skin_scan/product_categories_feature/product_detail.dart';
import 'package:skin_scan/product_categories_feature/product_filter.dart';
import 'package:skin_scan/utilities/utility.dart';

import '../entities/product_entities.dart';
import '../main.dart';
import '../provider/product_provider.dart';





class CategoryProducts extends StatefulWidget {
  final String categoryTitle;
  //final List<Product> productsOfCategory;
  const CategoryProducts({Key? key, required this.categoryTitle, })
      : super(key: key);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
   @override
  Widget build(BuildContext context) {
    //var currentCategory = widget.categoryTitle;
    return Scaffold(
        appBar: AppBarDetails(screenName: widget.categoryTitle),
        backgroundColor: Color(0xFFFFFDF4),
        body: Column(
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
                  textValue: ' Found ${context.read<ProductProvider>().getProductsOfCategory(widget.categoryTitle).length} results',
                  size: displayWidth(context) * 0.045,
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              DisplayProducts(listOfCategoryProducts: context.read<ProductProvider>().getProductsOfCategory(widget.categoryTitle)),



              // children: List.generate(
              //     ProductsLists.length,
              //         (index) => DisplayProducts(
              //         productImage: ProductsLists[index].productImage,
              //         productName: ProductsLists[index].productName,
              //         price: ProductsLists[index].price)),

              //] )
            ]),
        );
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
  final List<Product> listOfCategoryProducts;
  // final String productImage;
  // final String productName;
  // final int price;
  //var prodID;

  DisplayProducts(
      {Key? key,
        required this.listOfCategoryProducts})
      : super(key: key);



  @override
  _DisplayProductsState createState() => _DisplayProductsState();
}

class _DisplayProductsState extends State<DisplayProducts> {
  late int _rating;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        primary: false,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: widget.listOfCategoryProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
          displayWidth(context) / displayHeight(context) * 1.15,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return

    Padding(
        padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
        child: InkWell(
          child: Card(
              elevation: 2,
              color: Color(0xffBFC2A4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //SizedBox(height: displayHeight(context) * 0.005),
                  Padding(
                    padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.25,
                    ),
                    child: FavouriteButton(prodID: widget.listOfCategoryProducts[index].prodID),
                  ),

                  Image(
                      image: AssetImage('assets/dermatologistIcon.png'),
                      fit: BoxFit.fill,
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.1),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Padding(
                    padding:  EdgeInsets.all(displayWidth(context)*0.03),
                    child: ReemKufi_Green(
                        textValue: widget.listOfCategoryProducts[index].productName,
                        size: displayHeight(context) * 0.025),
                  ),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rating(product: widget.listOfCategoryProducts[index]),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rambla_Green_Italic(
                      textValue: widget.listOfCategoryProducts[index].productPrice.toString() + ' PKR',
                      size: displayHeight(context) * 0.025),
                ],
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: widget.listOfCategoryProducts[index]


                ),
              ),
            );
          },
        ));
        },

      ),
    );
  }
}