import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../main.dart';



class IngredientDetails extends StatefulWidget {
  final Ingredient ingredient;
  const IngredientDetails({Key? key, required this.ingredient}) : super(key: key);

  @override
  _IngredientDetailsState createState() => _IngredientDetailsState();
}

class _IngredientDetailsState extends State<IngredientDetails> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails( screenName: 'Ingredient'),
      backgroundColor: const Color(0xFFFFFDF4),
      body: Padding(
        padding: EdgeInsets.all(displayHeight(context)*0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: displayWidth(context)*0.27),
                child: Container(
                  height: displayHeight(context)*0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffDADBC6),
                  ),

                  child: Image(
                      alignment: Alignment.center,
                      image: AssetImage('assets/serumbottle.png'),
                      fit: BoxFit.fill,
                      height: displayHeight(context) * 0.155,
                      width: displayWidth(context) * 0.30),
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.03),
              Padding(
                  padding: EdgeInsets.only(left: displayWidth(context)*0.17, right: displayWidth(context)*0.07 ),

                  child: ReemKufi_Green_Bold_Center(textValue: widget.ingredient.ingredientName , size: displayHeight(context) * 0.04 )

              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: displayWidth(context)*0.27),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       ReemKufi_Green_Bold_Center(textValue: 'Rating: ' , size: displayHeight(context) * 0.04 ),
              //       ReemKufi_Green_Bold_Center(textValue: widget.ingredient.ingredientRating , size: displayHeight(context) * 0.04 ),
              //     ],
              //   ),
              // ),
              ReemKufi_Green_Bold_Left(textValue: 'Rating: ' , size: displayHeight(context) * 0.04 ),
              ReemKufi_Green_Bold_Left(textValue: widget.ingredient.ingredientRating , size: displayHeight(context) * 0.02 ),
              ReemKufi_Green_Bold_Left(textValue: 'Categories: ', size: displayHeight(context) * 0.04),
              Raleway_Green_Bold_Left(textValue: widget.ingredient.ingredientCategory, size: displayHeight(context) * 0.02),
              ReemKufi_Green_Bold_Left(textValue: 'Descripion: ', size: displayHeight(context) * 0.04),
              Raleway_Green_Bold_Left(textValue:   widget.ingredient.ingredientDescription, size: displayHeight(context) * 0.02),

            ],

          ),
        ),
      ),
    );
  }
}



