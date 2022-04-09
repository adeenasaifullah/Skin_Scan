import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/screenSizes.dart';
import 'main.dart';

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

  void dispose() {
    ingredient_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBarDetails(screenName: 'Categories'),
      //bottomNavigationBar: BottomBar(),

      backgroundColor: const Color(0xFFFFFDF4),

      body: Column(
        children: <Widget>[
          Text('Select to browse products by a category',
              style: GoogleFonts.rambla(
                  color: Color(0xFF283618),
                  fontSize: displayHeight(context) * 0.02,
                  fontStyle: FontStyle.italic)),
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

      //FILTER BUTTON
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => CameraApp(),
      //         ));
      //   },
      //   child: Icon(Icons.add),
      // ),

      //  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class AppBarDetails extends StatefulWidget implements PreferredSizeWidget {
//   final String screenName;
//   final String screenName2;
//   const AppBarDetails(
//       {Key? key, required this.screenName, this.screenName2 = ""})
//       : super(key: key);
//
//   @override
//   _AppBarDetailsState createState() => _AppBarDetailsState();
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(80);
// }
//
// class _AppBarDetailsState extends State<AppBarDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: AppBar(
//           elevation: 0,
//           backgroundColor: const Color(0xFFFFFDF4),
//           centerTitle: true,
//           title: RichText(
//
//
//             text: TextSpan(children: [
//               TextSpan(text: "\n"),
//               TextSpan(
//                 text: widget.screenName,
//                 style: GoogleFonts.reemKufi(
//                     color: Color(0xFF4D4D4D),
//                     fontSize: displayHeight(context) * 0.04),
//               ),
//               //TextSpan(text: "\n"),
//               TextSpan(
//                 text: widget.screenName2,
//                 style: GoogleFonts.reemKufi(
//                     color: Color(0xFF4D4D4D),
//                     fontSize: displayHeight(context) * 0.04),
//               )
//             ]),
//           ),
//           iconTheme: const IconThemeData(
//             color: const Color(0xFF4D4D4D), //change your color here
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.only(
//                   right: displayWidth(context) * 0.05,
//                   top: displayHeight(context) * 0.005),
//               child: Image(
//                   image: AssetImage('assets/dots for app dev.png'),
//                   fit: BoxFit.fill,
//                   height: displayHeight(context) * 1,
//                   width: displayWidth(context) * 0.1),
//             ),
//           ],
//         ));
//   }
// }

class Category extends StatefulWidget {
  final String categoryName;
  final String categoryImage;
  const Category(
      {Key? key, required this.categoryName, required this.categoryImage})
      : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
                  image: AssetImage(widget.categoryImage),
                  fit: BoxFit.contain,
                  height: displayHeight(context) * 0.125,
                  width: displayWidth(context) * 0.25),
              Text(widget.categoryName,
                  style: GoogleFonts.reemKufi(
                      color: Color(0xff283618),
                      fontSize: displayHeight(context) * 0.035)),
            ]));
  }
}



//CATEGORY PRODUCTS
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
        productImage: 'assets/serumbottle.png', productName: "Niacis", price: 2500));
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
        //bottomNavigationBar: BottomBar(),
        //body: SingleChildScrollView(
        //child: Column(
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
                  child: Text(
                    'Found 13 results',
                    style: GoogleFonts.rambla(
                        color: Color(0xff283618),
                        fontSize: displayHeight(context) * 0.03,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.02),

                Expanded(
                  child: GridView.count(
                    childAspectRatio:
                    displayWidth(context) / displayHeight(context)*1.3,
                    //crossAxisSpacing: displayWidth(context) * 0.0009,
                    //mainAxisSpacing: displayWidth(context)*0.0009,
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
                  Text(widget.productName,
                      style: GoogleFonts.reemKufi(
                          color: Color(0xff283618),
                          fontSize: displayHeight(context) * 0.025)),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rating(),

                  SizedBox(height: displayHeight(context) * 0.005),
                  Text(widget.price.toString() + ' PKR',
                      style: GoogleFonts.rambla(
                          color: Color(0xff000000),
                          fontSize: displayHeight(context) * 0.025,
                          fontStyle: FontStyle.italic))
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
                  //productRating: _rating,
                ),
              ),
            );
          },
        ));
  }
}

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: displayHeight(context) * 0.03,
      initialRating: 3,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Color(0xff283618),
        ),
        half: Icon(
          Icons.star_border,
          color: Color(0xff283618),
        ),
        empty: Icon(
          Icons.star_border,
          color: Color(0xff283618),
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

//PRODUCT DETAILS
class ProductDetail extends StatefulWidget {
  final String productName;
  final int productPrice;
  final String productImage;
  //final int productRating;

  const ProductDetail({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    //required this.productRating,
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDetails(screenName: widget.productName),
        //bottomNavigationBar: BottomBar(),
        backgroundColor: const Color(0xFFFFFDF4),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: displayWidth(context) * 0.35),
                  child: Card(
                    color: const Color(0xffDADBC6),
                    child: Image(
                        image: AssetImage(widget.productImage),
                        fit: BoxFit.fill,
                        height: displayHeight(context) * 0.2,
                        width: displayWidth(context) * 0.3),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.productName,
                        style: GoogleFonts.reemKufi(
                            color: Color(0xff283618),
                            fontSize: displayHeight(context) * 0.04)),
                    FavouriteButton(),
                  ],
                ),
                //SizedBox(height: displayHeight(context) * 0.02),
                Text(widget.productPrice.toString() + ' PKR',
                    style: GoogleFonts.rambla(
                        color: Color(0xff000000),
                        fontSize: displayHeight(context) * 0.03,
                        fontStyle: FontStyle.italic)),

                // Rating((productRating) {
                //   setState(() {
                //     _rating = productRating;
                //   });
                // }, 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Suitable for your skin type',
                        style: GoogleFonts.reemKufi(
                            color: Color(0xff283618),
                            fontSize: displayHeight(context) * 0.03)),
                    Icon(
                      CupertinoIcons.checkmark_circle,
                      color: Color(0xff283618),
                    )
                  ],
                ),
                Rating(),
                RatingButton(),

                SizedBox(height: displayHeight(context) * 0.02),
                Container(
                  width: displayWidth(context) * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffDADBC6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) * 0.03),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                softWrap: true,
                                style: GoogleFonts.reemKufi(
                                    color: Color(0xff283618),
                                    fontSize: displayHeight(context) * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Text(
                              'Healthier Looking Screen – T'
                                  'he face serum exfoliates for 2x surface skin cell'
                                  ' turnover(vs. facial moisturizer) while the night cream'
                                  ' hydrates for brighter and healthier looking skin',
                              softWrap: true,
                              style: GoogleFonts.reemKufi(
                                  color: Color(0xff4D4D4D),
                                  fontSize: displayHeight(context) * 0.025)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Ingredients',
                                  style: GoogleFonts.reemKufi(
                                      color: Color(0xff283618),
                                      fontSize: displayHeight(context) * 0.03,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('How To Use',
                                    style: GoogleFonts.reemKufi(
                                        color: Color(0xff283618),
                                        fontSize: displayHeight(context) * 0.03,
                                        fontWeight: FontWeight.bold)),
                              ]),

                          Text(
                              'Each day use the product throughly,'
                                  ' Apply on face using the tip of your fingers.'
                                  ' Each day use the product throughly, '
                                  'Apply on face using the tip of your fingers.',
                              softWrap: true,
                              style: GoogleFonts.reemKufi(
                                  color: Color(0xff4D4D4D),
                                  fontSize: displayHeight(context) * 0.025))

                          // Text(' Ingredient 1 14mg',
                          //     softWrap: true,
                          //     style: GoogleFonts.reemKufi(
                          //         color: Color(0xff283618),
                          //         fontSize: displayHeight(context) * 0.03)),
                        ]),
                  ),
                ),
              ]),
        ));
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          return showDialog(
            barrierDismissible: false,
            context: context, // user must tap button!
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color(0xff283618),
                title: Text('Add the product to favourite?',
                    style: GoogleFonts.reemKufi(
                        color: Color(0xffFFFDF4),
                        fontSize: displayHeight(context) * 0.04)),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(displayHeight(context) * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xffFFFDF4)),
                          child: Text('Yes',
                              style: GoogleFonts.reemKufi(
                                  color: Colors.black,
                                  fontSize: displayHeight(context) * 0.03)),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xffBBBD88)),
                          child: Text('Cancel',
                              style: GoogleFonts.reemKufi(
                                  color: Colors.black,
                                  fontSize: displayHeight(context) * 0.03)),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(CupertinoIcons.suit_heart));
  }
}

class RatingButton extends StatefulWidget {
  const RatingButton({Key? key}) : super(key: key);

  @override
  _RatingButtonState createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        fixedSize:
        Size(displayWidth(context) * 0.25, displayHeight(context) * 0.06),
        primary: const Color(0xff283618),
      ),
      onPressed: () async {
        return showDialog(
          barrierDismissible: false,
          context: context, // user must tap button!
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xffFFFDF4),
              title: Text('Rate the product',
                  style: GoogleFonts.reemKufi(
                      color: Color(0xff283618),
                      fontSize: displayHeight(context) * 0.04)),
              content: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.05),
                child: Rating(),
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(displayHeight(context) * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff283618)),
                        child: Text('Ok',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xFFFFFDF4),
                                fontSize: displayHeight(context) * 0.03)),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff283618)),
                        child: Text('Cancel',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xFFFFFDF4),
                                fontSize: displayHeight(context) * 0.03)),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Text('Rate',
          style: GoogleFonts.reemKufi(
              color: Color(0xFFFFFDF4),
              fontSize: displayHeight(context) * 0.03)),
    );
  }
}

//FILTER CLASS

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String dropdownValue = '15-25';
  var items = ['15-25', '26-35', '36-45', '46-55', '56+'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDetails(screenName: 'Filter'),
        backgroundColor: Color(0xFFFFFDF4),
        body: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.08),
                child: textStyle(text: 'Price Range', heightRatio: 0.04),
              ),
              Row(
                //DADBC6
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilterButtons(
                      widthSize: 0.22,
                      heightSize: 0.08,
                      buttonText: '<1000',
                      textSize: 0.02),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       setState(() {});
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       fixedSize: Size(displayWidth(context) * 0.22,
                  //           displayHeight(context) * 0.08),
                  //       primary: Color(0xffDADBC6),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //     ),
                  //     child: textStyle(text: '<1000', heightRatio: 0.02)),
                  FilterButtons(
                      widthSize: 0.22,
                      heightSize: 0.08,
                      buttonText: '>1000 <5000',
                      textSize: 0.02),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       fixedSize: Size(displayWidth(context) * 0.22,
                  //           displayHeight(context) * 0.08),
                  //       primary: Color(0xffDADBC6),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //     ),
                  //     child: textStyle(text: '>1000 <5000', heightRatio: 0.02)),
                  FilterButtons(
                      widthSize: 0.22,
                      heightSize: 0.08,
                      buttonText: '>5000',
                      textSize: 0.02),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       fixedSize: Size(displayWidth(context) * 0.22,
                  //           displayHeight(context) * 0.08),
                  //       primary: Color(0xffDADBC6),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //     ),
                  //     child: textStyle(text: '>5000', heightRatio: 0.02)),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: textStyle(text: 'Age', heightRatio: 0.04),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xffDADBC6),
                  ),

                  width: displayWidth(context) * 0.3,
                  //color: Color(0xffDADBC6),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      //menuMargin: EdgeInsets.zero,
                      menuMaxHeight: displayHeight(context) * 0.2,

                      isExpanded: true,
                      dropdownColor: Color(0xffDADBC6),
                      value: dropdownValue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      icon: const Icon(Icons.arrow_downward_sharp),

                      underline: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffDADBC6)),
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: textStyle(text: items, heightRatio: 0.03),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: textStyle(text: 'Gender', heightRatio: 0.04),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: Row(
                  //DADBC6
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FilterButtons(
                        widthSize: 0.25,
                        heightSize: 0.06,
                        buttonText: 'Male',
                        textSize: 0.03),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //       fixedSize: Size(displayWidth(context) * 0.25,
                    //           displayHeight(context) * 0.06),
                    //       primary: Color(0xffDADBC6),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //       ),
                    //     ),
                    //     child: textStyle(text: 'Male', heightRatio: 0.03)),
                    SizedBox(width: displayWidth(context) * 0.06),
                    FilterButtons(
                        widthSize: 0.28,
                        heightSize: 0.06,
                        buttonText: 'Female',
                        textSize: 0.03),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //       fixedSize: Size(displayWidth(context) * 0.28,
                    //           displayHeight(context) * 0.06),
                    //       primary: Color(0xffDADBC6),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //       ),
                    //     ),
                    //     child: textStyle(text: 'Female', heightRatio: 0.03)),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: textStyle(text: 'Sort By', heightRatio: 0.04),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: Row(
                  //DADBC6
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FilterButtons(
                        widthSize: 0.25,
                        heightSize: 0.06,
                        buttonText: 'Rating',
                        textSize: 0.03),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //       fixedSize: Size(displayWidth(context) * 0.25,
                    //           displayHeight(context) * 0.06),
                    //       primary: Color(0xffDADBC6),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //       ),
                    //     ),
                    //     child: textStyle(text: 'Rating', heightRatio: 0.03)),
                    SizedBox(width: displayWidth(context) * 0.06),
                    FilterButtons(
                        widthSize: 0.25,
                        heightSize: 0.06,
                        buttonText: 'Price',
                        textSize: 0.03),
                    // ElevatedButton(
                    //     onPressed: () {},
                    //     style: ElevatedButton.styleFrom(
                    //       fixedSize: Size(displayWidth(context) * 0.25,
                    //           displayHeight(context) * 0.06),
                    //       primary: Color(0xffDADBC6),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //       ),
                    //     ),
                    //     child: textStyle(text: 'Price', heightRatio: 0.03)),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.08),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () async {
                        return showDialog(
                          barrierDismissible: false,
                          context: context, // user must tap button!
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xff283618),
                              title: Text('Do you want to save changes?',
                                  style: GoogleFonts.reemKufi(
                                      color: Color(0xffFFFDF4),
                                      fontSize: displayHeight(context) * 0.04)),
                              actions: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Color(0xffFFFDF4)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: Text('Yes',
                                              style: GoogleFonts.reemKufi(
                                                  color: Colors.black,
                                                  fontSize:
                                                  displayHeight(context) *
                                                      0.03)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Color(0xffBBBD88)),
                                        child: Text('Cancel',
                                            style: GoogleFonts.reemKufi(
                                                color: Colors.black,
                                                fontSize:
                                                displayHeight(context) *
                                                    0.03)),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(displayWidth(context) * 0.25,
                            displayHeight(context) * 0.06),
                        primary: Color(0xff283618),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      // child: textStyle(text: 'Save', heightRatio: 0.03)),
                      child: Text('Save',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.reemKufi(
                              color: Color(0xffFFFDF4),
                              fontSize: displayHeight(context) * 0.03)))),
            ],
          ),
        ));
  }
}

class textStyle extends StatefulWidget {
  final String text;
  final double heightRatio;
  const textStyle({Key? key, required this.text, required this.heightRatio})
      : super(key: key);

  @override
  _textStyleState createState() => _textStyleState();
}

class _textStyleState extends State<textStyle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.reemKufi(
          color: Color(0xff283618),
          fontSize: displayHeight(context) * widget.heightRatio),
    );
  }
}

class FilterButtons extends StatefulWidget {
  final String buttonText;
  final double textSize;
  final double widthSize;
  final double heightSize;
  const FilterButtons(
      {Key? key,
        required this.widthSize,
        required this.heightSize,
        required this.buttonText,
        required this.textSize})
      : super(key: key);

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  bool color4button = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          color4button = !color4button;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(displayWidth(context) * widget.widthSize,
              displayHeight(context) * widget.heightSize),
          primary: !color4button ? Color(0xffDADBC6) : Color(0xff738A58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child:
        textStyle(text: widget.buttonText, heightRatio: widget.textSize));
  }
}


