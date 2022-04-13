import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categoriesAndSearch.dart';
import 'main.dart';
import 'screenSizes.dart';


class IngredientDetails extends StatefulWidget {
  final String ingredientName;
  const IngredientDetails({Key? key, required this.ingredientName}) : super(key: key);

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

                child: ReemKufi_Green_Bold_Center(textValue: widget.ingredientName , size: displayHeight(context) * 0.04 )

              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: displayWidth(context)*0.27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ReemKufi_Green_Bold_Center(textValue: 'Safe: ' , size: displayHeight(context) * 0.04 ),
                    ReemKufi_Green_Bold_Center(textValue: 'Yes' , size: displayHeight(context) * 0.04 ),


                  ],
                ),
              ),
              ReemKufi_Green_Bold_Left(textValue: 'Properties', size: displayHeight(context) * 0.04),
              Raleway_Green_Bold_Left(textValue:   "Hyaluronic acid, also known as hyaluronan,"
                  " a clear, gooey substance that  naturally produced by"
                  " your body. The largest amounts of it are found in your skin,"
                  " connective tissue and eyes. Its main function is to retain"
                  " water to keep your tissues well lubricated and moist ", size: displayHeight(context) * 0.02),
             ReemKufi_Green_Bold_Left(textValue: 'Benefits', size: displayHeight(context) * 0.04),
            Raleway_Green_Bold_Left(textValue: "Promotes Healthier, More Supple Skin. Share on Pinterest."
                "Can Speed Wound Healing."
                " Relieve Joint Pain by Keeping Bones Well Lubricated."
                "Soothe Acid Reflux Symptoms."
                " Relieve Dry Eye and Discomfort. ", size: displayHeight(context) * 0.02),

            ],

          ),
        ),
      ),
    );
  }
}



