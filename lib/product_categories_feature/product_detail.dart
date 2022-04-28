import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/product_categories_feature/product_categories_utilities.dart';
import 'package:skin_scan/provider/product_provider.dart';
import 'package:skin_scan/utilities/utility.dart';

import '../entities/product_entities.dart';
import '../main.dart';

class ProductDetail extends StatefulWidget {

  final Product product;


  const ProductDetail({
    Key? key,

    required this.product,

  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDetails(screenName: widget.product.productName),
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
                        image: AssetImage('assets/moisturizerbottle.png'),
                        fit: BoxFit.fill,
                        height: displayHeight(context) * 0.15,
                        width: displayWidth(context) * 0.15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ReemKufi_Green(
                        textValue: widget.product.productName,
                        size: displayHeight(context) * 0.035),
                    FavouriteButton(),
                  ],
                ),
                Rambla_Green_Italic(
                    textValue: widget.product.productPrice.toString() + ' PKR',
                    size: displayHeight(context) * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReemKufi_Green(
                        textValue: 'Suitable for your skin type',
                        size: displayHeight(context) * 0.03),
                    Icon(
                      CupertinoIcons.checkmark_circle,
                      color: Color(0xff283618),
                    )
                  ],
                ),
                Rating(product: widget.product),
                //RatingButton(product: widget.product),
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
                              ReemKufi_Green_Bold(
                                  textValue: 'Description',
                                  size: displayHeight(context) * 0.03),
                            ],
                          ),
                          ReemKufi_Grey(
                              textValue: widget.product.productDescription,
                              size: displayHeight(context) * 0.025),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReemKufi_Green_Bold(
                                  textValue: 'Ingredients',
                                  size: displayHeight(context) * 0.03),
                            ],
                          ),
                          ReemKufi_Grey(
                              textValue: widget.product.productIngredients,
                              size: displayHeight(context) * 0.025),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ReemKufi_Green_Bold(
                                    textValue: 'How To Use',
                                    size: displayHeight(context) * 0.03),
                              ]),
                          ReemKufi_Grey(
                              textValue: widget.product.howToUse,
                              size: displayHeight(context) * 0.025),
                        ]),
                  ),
                ),
              ]),
        ));
  }
}

// class RatingButton extends StatefulWidget {
//   final Product product;
//   const RatingButton({Key? key, required this.product}) : super(key: key);
//
//   @override
//   _RatingButtonState createState() => _RatingButtonState();
// }
//
// class _RatingButtonState extends State<RatingButton> {
//   @override
//   Widget build(BuildContext context) {
//     return GreenButton(
//         textSize: displayHeight(context) * 0.03,
//         buttonWidth: displayWidth(context) * 0.25,
//         buttonHeight: displayHeight(context) * 0.06,
//         buttonText: 'Rate',
//         onPressed: () async {
//           return showDialog(
//             barrierDismissible: false,
//             context: context, // user must tap button!
//             builder: (context) {
//               return AlertDialog(
//                 backgroundColor: const Color(0xFFFFFDF4),
//                 title: ReemKufi_Green(
//                     textValue: 'Rate the product',
//                     size: displayHeight(context) * 0.04),
//                 content: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: displayWidth(context) * 0.05),
//                   child: Rating(product: widget.product),
//                 ),
//                 actions: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.all(displayHeight(context) * 0.03),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         TextButton(
//                           style: TextButton.styleFrom(
//                               backgroundColor: Color(0xff283618)),
//                           child: ReemKufiOffwhite(
//                               textValue: 'Ok',
//                               size: displayHeight(context) * 0.03),
//                           onPressed: () {
//                             context.watch<ProductProvider>().getUserRating()
//                             Navigator.of(context).pop(true);
//
//                           },
//                         ),
//                         TextButton(
//                           style: TextButton.styleFrom(
//                               backgroundColor: Color(0xff283618)),
//                           child: ReemKufiOffwhite(
//                               textValue: 'Cancel',
//                               size: displayHeight(context) * 0.03),
//                           onPressed: () {
//                             Navigator.of(context).pop(false);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//
//   }
// }