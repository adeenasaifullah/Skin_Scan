import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../entities/product_entities.dart';
import '../main.dart';
import '../product_categories_feature/product_detail.dart';
import '../utilities/utility.dart';

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({Key? key}) : super(key: key);

  @override
  _FavouriteProductsState createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  final List<FavouriteProductsCard> FavouriteLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "Paula's Choice",
      productRating: 4,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "CoNatural",
      productRating: 3,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "Niacis",
      productRating: 5,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "The Ordinary",
      productRating: 4,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "Vitamin C",
      productRating: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Favourite Products'),
      backgroundColor: Color(0xFFFFFDF4),
      //body: SingleChildScrollView(
      //child: Column(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayHeight(context) * 0.02),
            Expanded(
              child: GridView.count(
                childAspectRatio:
                displayWidth(context) / displayHeight(context) * 1.6,
                //crossAxisSpacing: 12,
                //mainAxisSpacing: 12,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: List.generate(
                    FavouriteLists.length,
                        (index) => FavouriteProductsCard(
                          //product: products,
                      productImage: FavouriteLists[index].productImage,
                      productName: FavouriteLists[index].productName,
                      productRating: FavouriteLists[index].productRating,
                    )),
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}

class FavouriteProductsCard extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productRating;
  //final Product product;

  const FavouriteProductsCard(
      {Key? key,
        //required this.product,
        required this.productImage,
        required this.productName,
        required this.productRating
      })
      : super(key: key);

  @override
  _FavouriteProductsCardState createState() => _FavouriteProductsCardState();
}

class _FavouriteProductsCardState extends State<FavouriteProductsCard> {
  late int _rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: InkWell(
          child: Card(
              elevation: 2,
              color: Color(0xFFDADBC6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: displayWidth(context) * 0.25),

                    child: IconButton(
                        onPressed: () async {
                          return showDialog(
                            barrierDismissible: false,
                            context: context, // user must tap button!
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xff283618),
                                title: ReemKufiOffwhite(textValue: 'Are you sure you want to unfavourite this product?',size: displayHeight(context) * 0.04),
                                actions: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(
                                        displayHeight(context) * 0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                              Color(0xffFFFDF4)),
                                          child: Text('Yes',
                                              style: GoogleFonts.reemKufi(
                                                  color: Colors.black,
                                                  fontSize:
                                                  displayHeight(context) *
                                                      0.03)),
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                              Color(0xffBBBD88)),
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
                        icon: Icon(Icons.favorite, color: Colors.black)),
                  ),
                  Image(
                      image: AssetImage(widget.productImage),
                      fit: BoxFit.fill,
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.1),
                  SizedBox(height: displayHeight(context) * 0.005),
                  ReemKufi_Green(textValue: widget.productName, size: displayHeight(context) * 0.025),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rating(
                    productRating: widget.productRating,
                  ),
                ],
              )),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProductDetail(),
            //   ),
            // );
          },
        ));
  }
}

class Rating extends StatefulWidget {
  final int productRating;
  const Rating({Key? key, required this.productRating}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: displayHeight(context) * 0.03,
      initialRating: widget.productRating.toDouble(),
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