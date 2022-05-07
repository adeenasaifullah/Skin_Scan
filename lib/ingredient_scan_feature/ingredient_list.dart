import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../ingredient_search_feature/ingredient_details.dart';
import '../main.dart';

class IngredientsList extends StatefulWidget {
  final List<Ingredient> IngredientList ;
  const IngredientsList({Key? key, required this.IngredientList}) : super(key: key);

  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Product Name'),
      // bottomNavigationBar: BottomBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.04),
              child: TextField(
                  autofocus: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Name',
                    hintStyle: GoogleFonts.rambla(
                        color: Color(0xff283618),
                        fontSize: displayHeight(context) * 0.025,
                        fontStyle: FontStyle.italic),
                    fillColor: Color(0xffDADBC6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                            width: displayWidth(context) * 0.03,
                            style: BorderStyle.solid)),
                    filled: true,
                    contentPadding:
                    EdgeInsets.all(displayHeight(context) * 0.01),
                  )),
            ),
            ReemKufi_Green_Bold(
                textValue: 'Ingredients:', size: displayHeight(context) * 0.04),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.IngredientList.length,
                  itemBuilder: (context, index) {
                    print(widget.IngredientList[index].ingredientName);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IngredientDetails(
                                ingredient: widget.IngredientList[index])));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDADBC6),
                            borderRadius: BorderRadius.circular(
                                20), //border corner radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReemKufi_Green_Italic(
                                    textValue: widget.IngredientList[index].ingredientName,
                                    size: displayHeight(context) * 0.02),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                IngredientDetails(
                                                    ingredient:
                                                    widget.IngredientList[index]),
                                          ));
                                    },
                                    icon: Icon(Icons.arrow_forward_rounded)),
                              ],
                            ),
                          )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}