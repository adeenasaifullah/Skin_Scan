import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../main.dart';

class IngredientDetails extends StatefulWidget {
  final Ingredient ingredient;
  const IngredientDetails({Key? key, required this.ingredient})
      : super(key: key);

  @override
  _IngredientDetailsState createState() => _IngredientDetailsState();
}

class _IngredientDetailsState extends State<IngredientDetails> {
  @override
  late bool descriptionCheck;
  late bool ratingCheck;
  late bool categoriesCheck;

  void initState() {
    super.initState();
    ratingCheck = widget.ingredient.ingredientRating == "" ? false : true;
    descriptionCheck =
        widget.ingredient.ingredientDescription == "" ? false : true;
    categoriesCheck = widget.ingredient.ingredientCategory == "" ? false : true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Ingredient'),
      backgroundColor: const Color(0xFFFFFDF4),
      body: Padding(
        padding: EdgeInsets.all(displayHeight(context) * 0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ReemKufi_Green_Bold_Center(
                  textValue: widget.ingredient.ingredientName.trim(),
                  size: displayWidth(context) * 0.08),
              SizedBox(height: displayHeight(context) * 0.01),
              if (ratingCheck) ...{
                ReemKufi_Green_Bold_Left(
                    textValue: 'Rating: ',
                    size: displayHeight(context) * 0.035),
                Raleway_Green_Bold_Left(
                    textValue: widget.ingredient.ingredientRating.trim(),
                    size: displayHeight(context) * 0.02),
                SizedBox(height: displayHeight(context) * 0.01),
              },
              if (categoriesCheck) ...{
                ReemKufi_Green_Bold_Left(
                    textValue: 'Categories: ',
                    size: displayHeight(context) * 0.035),
                Raleway_Green_Bold_Left(
                    textValue: widget.ingredient.ingredientCategory.trim(),
                    size: displayHeight(context) * 0.02),
                SizedBox(height: displayHeight(context) * 0.01),
              },
              if (descriptionCheck) ...{
                ReemKufi_Green_Bold_Left(
                    textValue: 'Descripion: ',
                    size: displayHeight(context) * 0.035),
                Raleway_Green_Bold_Left(
                    textValue: widget.ingredient.ingredientDescription.trim(),
                    size: displayHeight(context) * 0.02),
                SizedBox(height: displayHeight(context) * 0.01),
              },
              SizedBox(height: displayHeight(context) * 0.099),
              Padding(
                padding: EdgeInsets.fromLTRB(displayWidth(context) * 0.02, 0,
                    displayWidth(context) * 0.02, 0),
                child: Container(
                  height: displayHeight(context) * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffDADBC6),
                  ),
                  child: Image(
                      alignment: Alignment.center,
                      image: AssetImage('assets/ingredients.jpg'),
                      fit: BoxFit.fill,
                      height: displayHeight(context) * 0.155,
                      width: displayWidth(context) * 0.95),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
