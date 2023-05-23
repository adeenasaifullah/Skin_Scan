import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../entities/product_entities.dart';
import '../provider/product_provider.dart';
import '../provider/user_provider.dart';

class Rating extends StatefulWidget {
  final Product product;

  const Rating({Key? key, required this.product}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: displayHeight(context) * 0.025,
      initialRating: widget.product.productRating.toDouble(),
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Color(0xff283618),
        ),
        half: const Icon(
          Icons.star_border,
          color: Color(0xff283618),
        ),
        empty: const Icon(
          Icons.star_border,
          color: Color(0xff283618),
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        Provider.of<ProductProvider>(context, listen: false)
            .updateRating(widget.product, rating);
        setState(() {
          this.rating = rating;
        });
      },
    );
  }
}

class FavouriteButton extends StatefulWidget {
  var prodID;
  FavouriteButton({Key? key, this.prodID}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return !context
            .read<UserProvider>()
            .checkUserFavouriteProduct(widget.prodID)
        ? IconButton(
            icon: const Icon(CupertinoIcons.suit_heart),
            onPressed: () async {
              await showDialog(
                barrierDismissible: false,
                context: context, // user must tap button!
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xff283618),
                    title: ReemKufi_OffWhite_Center(
                        textValue: 'Add the product to favourite?',
                        size: displayHeight(context) * 0.04),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(displayHeight(context) * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffFFFDF4)),
                              child: ReemKufi_Black(
                                  textValue: 'Yes',
                                  size: displayHeight(context) * 0.03),
                              onPressed: () {
                                context
                                    .read<UserProvider>()
                                    .addProductToFavourites(widget.prodID);
                                setState(() {});
                                Navigator.of(context).pop(true);
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffBBBD88)),
                              child: ReemKufi_Black(
                                  textValue: 'Cancel',
                                  size: displayHeight(context) * 0.03),
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
            })
        : IconButton(
            icon: const Icon(CupertinoIcons.suit_heart_fill),
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context, // user must tap button!
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xff283618),
                    title: ReemKufi_OffWhite_Center(
                        textValue:
                            'Are you sure you want to un-favourite this product?',
                        size: displayHeight(context) * 0.04),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(displayHeight(context) * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffFFFDF4)),
                              child: ReemKufi_Black(
                                  textValue: 'Yes',
                                  size: displayHeight(context) * 0.03),
                              onPressed: () {
                                context
                                    .read<UserProvider>()
                                    .removeProductFromFavourites(widget.prodID);
                                setState(() {});
                                Navigator.of(context).pop(true);
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xffBBBD88)),
                              child: ReemKufi_Black(
                                  textValue: 'Cancel',
                                  size: displayHeight(context) * 0.03),
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
            });
  }
}
