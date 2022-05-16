import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../ingredient_search_feature/ingredient_details.dart';
import '../main.dart';


class IngredientListScannedProduct extends StatefulWidget {
  final List<Ingredient> IngredientList;
  final String productName;
  const IngredientListScannedProduct({Key? key, required this.IngredientList, required this.productName}) : super(key: key);

  @override
  _IngredientListScannedProductState createState() => _IngredientListScannedProductState();
}

class _IngredientListScannedProductState extends State<IngredientListScannedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: 'Ingredient List'),
      // bottomNavigationBar: BottomBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ReemKufi_Green(
            //     textValue: 'Product Name: ' + widget.productName,
            //     size: displayHeight(context) * 0.035),
            // ReemKufi_Green_Bold(
            //     textValue: 'Ingredients:',
            //     size: displayHeight(context) * 0.04),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.IngredientList.length,
                  itemBuilder: (context, index) {
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
            ),
          ],
        ),
      ),
    );
  }
}
