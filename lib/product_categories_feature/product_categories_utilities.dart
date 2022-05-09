import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
//import 'package:skin_scan/provider/UserProvider.dart';
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

  //final double initialRating = widget.product.productRating.toDouble()

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: displayHeight(context) * 0.025,
      initialRating: widget.product.productRating.toDouble(),
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
        //rating = (rating + widget.product.productRating)/2;
        //_rating = rating;
        //print(_rating);
        //context.watch()<ProductProvider>().updateRating(widget.product, rating);
        Provider.of<ProductProvider>(context, listen: false)
            .updateRating(widget.product, rating);
        setState(() {
          this.rating = rating;
          //context.watch()<ProductProvider>().updateRating(widget.product, rating);
        });

        print(rating);
      },
    );
  }
}

class FavouriteButton extends StatefulWidget {

  bool isFavourite = false;
  var prodID;
  FavouriteButton({Key? key, this.prodID}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {



  @override
  Widget build(BuildContext context) {
    return !widget.isFavourite ?
    IconButton(

      //icon: !widget.isFavourite ? Icon(CupertinoIcons.suit_heart) : Icon(CupertinoIcons.suit_heart_fill),
      icon:Icon(CupertinoIcons.suit_heart),
      onPressed: () async {
        //!widget.isFavourite
        //favouriteIcon == CupertinoIcons.suit_heart
           // ?
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
                                  backgroundColor: Color(0xffFFFDF4)),
                              child: ReemKufi_Black(
                                  textValue: 'Yes',
                                  size: displayHeight(context) * 0.03),
                              onPressed: () {
                                //favouriteIcon =CupertinoIcons.suit_heart_fill;
                                //Provider.of<UserProvider>(context, listen: false).addProductToFavourites(widget.prodID);
                                widget.isFavourite = !widget.isFavourite;
                                //UnFavouriteButton(prodID: widget.prodID);
                                context.read<UserProvider>().addProductToFavourites(widget.prodID);
                                setState(() {

                                });
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

        //UnFavouriteButton(prodID: widget.prodID);

      }
    ):
    IconButton(
            icon:Icon(CupertinoIcons.suit_heart_fill),
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
                              backgroundColor: Color(0xffFFFDF4)),
                          child: ReemKufi_Black(
                              textValue: 'Yes',
                              size: displayHeight(context) * 0.03),
                          onPressed: () {
                            widget.isFavourite = !widget.isFavourite;

                            //FavouriteButton(prodID: widget.prodID);
                            //favouriteIcon = CupertinoIcons.suit_heart;
                            context.read<UserProvider>()
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

        }

        );
  }
}

//CupertinoIcons.suit_heart




