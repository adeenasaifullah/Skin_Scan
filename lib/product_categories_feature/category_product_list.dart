import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/product_categories_feature/product_categories_utilities.dart';
import 'package:skin_scan/product_categories_feature/product_detail.dart';
import 'package:skin_scan/product_categories_feature/product_filter.dart';
import 'package:skin_scan/provider/search_provider.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../entities/product_entities.dart';
import '../provider/product_provider.dart';

class CategoryProducts extends StatefulWidget {
  final String categoryTitle;
  const CategoryProducts({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  late List<Product> currentFilteredList;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String dropDownVal =
        Provider.of<SearchProvider>(context, listen: false).dropdownvalue;
    List<Product> categoryProdList =
        Provider.of<ProductProvider>(context, listen: false)
            .getProductsOfCategory(widget.categoryTitle);
    currentFilteredList = Provider.of<SearchProvider>(context, listen: false)
        .filterAccToPrice(dropDownVal, categoryProdList);
    return Scaffold(
      appBar: AppBarCategories(screenName: widget.categoryTitle),
      backgroundColor: const Color(0xFFFFFDF4),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayHeight(context) * 0.02),
            SearchandFilter(categoryTitle: widget.categoryTitle),
            SizedBox(height: displayHeight(context) * 0.01),
            Padding(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.02,
                  left: displayWidth(context) * 0.04),
              child: Rambla_Green_Italic(
                textValue: (currentFilteredList.isNotEmpty)
                    ? 'Found ${currentFilteredList.length} result(s)'
                    : ' Found ${context.read<ProductProvider>().getProductsOfCategory(widget.categoryTitle).length} results',
                size: displayWidth(context) * 0.045,
              ),
            ),
            SizedBox(height: displayHeight(context) * 0.02),
            (Provider.of<SearchProvider>(context, listen: false)
                    .searchBarActive)
                ? DisplayProducts(
                    listOfCategoryProducts:
                        Provider.of<SearchProvider>(context, listen: false)
                            .getSearchList())
                : DisplayProducts(listOfCategoryProducts: currentFilteredList)
          ]),
    );
  }
}

class SearchandFilter extends StatefulWidget {
  final String categoryTitle;
  SearchandFilter({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  _SearchandFilterState createState() => _SearchandFilterState();
}

class _SearchandFilterState extends State<SearchandFilter> {
  TextEditingController searchController = TextEditingController();
  List<Product> currentFilteredList = [];
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
              controller: searchController,
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Search for a product',
                hintStyle: GoogleFonts.rambla(
                    color: const Color(0xff283618),
                    fontSize: displayHeight(context) * 0.025,
                    fontStyle: FontStyle.italic),
                fillColor: const Color(0xffDADBC6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                        width: displayWidth(context) * 0.03,
                        style: BorderStyle.solid)),
                filled: true,
                contentPadding: EdgeInsets.all(displayHeight(context) * 0.01),
                suffixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                if (searchController.text.isEmpty) {
                  Provider.of<SearchProvider>(context, listen: false)
                      .searchBarActive = false;
                  String dropDownVal =
                      Provider.of<SearchProvider>(context, listen: false)
                          .dropdownvalue;
                  List<Product> categoryProdList =
                      Provider.of<ProductProvider>(context, listen: false)
                          .getProductsOfCategory(widget.categoryTitle);
                  currentFilteredList =
                      Provider.of<SearchProvider>(context, listen: false)
                          .filterAccToPrice(dropDownVal, categoryProdList);
                }
                List<Product> filteredCategoryList =
                    Provider.of<SearchProvider>(context, listen: false)
                        .getFilteredList();
                Provider.of<SearchProvider>(context, listen: false)
                    .searchBar(value, filteredCategoryList);
                setState(() {});
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: displayWidth(context) * 0.03),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffDADBC6),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Filter(
                          listOfCategoryProducts: context
                              .read<ProductProvider>()
                              .getProductsOfCategory(widget.categoryTitle),
                          categoryTitle: widget.categoryTitle,
                        ),
                      ));
                },
                icon: Image.asset('assets/filter.png',
                    height: displayHeight(context) * 0.05,
                    width: displayWidth(context) * 0.05,
                    fit: BoxFit.fill),
                color: const Color(0xff283618)),
          ),
        )
      ],
    );
  }
}

class DisplayProducts extends StatefulWidget {
  final List<Product> listOfCategoryProducts;

  DisplayProducts({Key? key, required this.listOfCategoryProducts})
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
          return Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: InkWell(
                child: Card(
                    elevation: 2,
                    color: const Color(0xffBFC2A4),
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
                          child: FavouriteButton(
                              prodID:
                                  widget.listOfCategoryProducts[index].prodID),
                        ),

                        Image(
                          image: FirebaseImage(
                              widget.listOfCategoryProducts[index].productImage,
                              cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
                          fit: BoxFit.contain,
                          height: displayHeight(context) * 0.1,
                          width: displayWidth(context) * 0.25,
                        ),
                        SizedBox(height: displayHeight(context) * 0.005),
                        Padding(
                          padding: EdgeInsets.all(displayWidth(context) * 0.03),
                          child: ReemKufi_Green(
                              textValue: widget
                                  .listOfCategoryProducts[index].productName,
                              size: displayHeight(context) * 0.025),
                        ),
                        SizedBox(height: displayHeight(context) * 0.005),
                        Rating(product: widget.listOfCategoryProducts[index]),
                        SizedBox(height: displayHeight(context) * 0.005),
                        Rambla_Green_Italic(
                            textValue: widget
                                    .listOfCategoryProducts[index].productPrice
                                    .toString() +
                                ' PKR',
                            size: displayHeight(context) * 0.025),
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(
                          product: widget.listOfCategoryProducts[index]),
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}

class AppBarCategories extends StatefulWidget implements PreferredSizeWidget {
  final String screenName;
  const AppBarCategories({Key? key, required this.screenName})
      : super(key: key);

  @override
  _AppBarCategoriesState createState() => _AppBarCategoriesState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarCategoriesState extends State<AppBarCategories> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFDF4),
          centerTitle: false,
          leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
                Provider.of<SearchProvider>(context, listen: false)
                    .dropdownvalue = 'No filter';
              }),
          title: ReemKufi_Grey(
              textValue: widget.screenName,
              size: displayHeight(context) * 0.03),
          iconTheme: const IconThemeData(
            color: Color(0xFF4D4D4D), //change your color here
          )),
    );
  }
}
