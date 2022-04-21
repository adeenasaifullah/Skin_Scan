import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skin_scan/utilities/utility.dart';

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
        },
        icon: Icon(CupertinoIcons.suit_heart));
  }
}