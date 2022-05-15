import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/product_categories_feature/product_categories_utilities.dart';
import '../entities/product_entities.dart';
import '../main.dart';
import '../product_categories_feature/product_detail.dart';
import '../provider/product_provider.dart';
import '../provider/user_provider.dart';
import '../utilities/utility.dart';

class FavouriteProducts extends StatefulWidget {


   FavouriteProducts({Key? key}) : super(key: key);

  @override
  _FavouriteProductsState createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  List<Product> productsList = [];
  @override
  Widget build(BuildContext context) {

    productsList = context.read<ProductProvider>().getProducts;
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
            FavouriteProductsCard(
                FavouriteLists: context
                    .watch<UserProvider>()
                    .getUserFavouriteProducts(productsList))
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}

class FavouriteProductsCard extends StatefulWidget {
  List<Product> FavouriteLists;

  FavouriteProductsCard({
    Key? key,
    required this.FavouriteLists,
  }) : super(key: key);

  @override
  _FavouriteProductsCardState createState() => _FavouriteProductsCardState();
}

class _FavouriteProductsCardState extends State<FavouriteProductsCard> {
  late int _rating;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        primary: false,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: widget.FavouriteLists.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              displayWidth(context) / displayHeight(context) * 1.6,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
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
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.25),
                          child: FavouriteButton(
                              prodID: widget.FavouriteLists[index].prodID),
                        ),
                        Image(
                            image: NetworkImage(
                                "https://drive.google.com/uc?export=view&id=1pN_AcjbZfXgBznRfl13vGBgCSCpoVASz"),
                            fit: BoxFit.fill,
                            height: displayHeight(context) * 0.1,
                            width: displayWidth(context) * 0.1),
                        SizedBox(height: displayHeight(context) * 0.005),
                        ReemKufi_Green(
                            textValue: widget.FavouriteLists[index].productName,
                            size: displayHeight(context) * 0.025),
                        SizedBox(height: displayHeight(context) * 0.005),
                        // Rating(
                        //   productRating: widget.productRating,
                        // ),
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(product: widget.FavouriteLists[index]),
                    ),
                  );
                },
              ));
        },
      ),
    );
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
