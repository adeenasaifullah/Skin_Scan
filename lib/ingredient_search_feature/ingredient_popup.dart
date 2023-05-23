import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../entities/ingredient_entities.dart';
import '../ingredient_search_feature/ingredient_details.dart';
import '../provider/ingredient_provider.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../utilities/bottom_app_bar.dart';

class IngredientPopUp extends StatefulWidget {
  const IngredientPopUp({Key? key}) : super(key: key);

  @override
  _IngredientPopUpState createState() => _IngredientPopUpState();
}

class _IngredientPopUpState extends State<IngredientPopUp> {
  TextEditingController ingredient_controller = TextEditingController();

  void dispose() {
    ingredient_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AlertDialog(
      backgroundColor: const Color(0xff283618),
      title: ReemKufiOffwhite(
        textValue: 'Enter your ingredient',
        size: displayHeight(context) * 0.04,
      ),
      content: TextField(
        controller: ingredient_controller,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Enter your ingredient',
          hintStyle: GoogleFonts.reemKufi(
              color: Color(0xffFFFDF4),
              fontSize: displayHeight(context) * 0.03),
        ),
        style: GoogleFonts.reemKufi(
            color: Color(0xffFFFDF4), fontSize: displayHeight(context) * 0.03),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(displayHeight(context) * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffBBBD88)),
                child: ReemKufi_Black(
                  textValue: 'Continue',
                  size: displayHeight(context) * 0.03,
                ),
                onPressed: () async {
                  Provider.of<IngredientProvider>(context, listen: false)
                      .ingredientList
                      .clear();
                  await Provider.of<IngredientProvider>(context, listen: false)
                      .getIngredientInfo(ingredient_controller.text);
                  int length = await Provider.of<IngredientProvider>(context,
                          listen: false)
                      .ingredientList
                      .length;
                  if (length != 0) {
                    Ingredient ingredient =
                        await Provider.of<IngredientProvider>(context,
                                listen: false)
                            .ingredientList[0];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IngredientDetails(
                            ingredient: ingredient,
                          ),
                        ));
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context, // user must tap button!
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xff283618),
                          title: Column(
                            children: [
                              ReemKufiOffwhite(
                                  textValue: 'Ingredient not found',
                                  size: displayHeight(context) * 0.04),
                            ],
                          ),
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
                                      child: Text('OK',
                                          style: GoogleFonts.reemKufi(
                                              color: Colors.black,
                                              fontSize: displayHeight(context) *
                                                  0.03)),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
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
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffBBBD88)),
                child: ReemKufi_Black(
                  textValue: 'Cancel',
                  size: displayHeight(context) * 0.03,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyBottomAppBar(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
