import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/entities/scanned_product_entities.dart';
import 'package:skin_scan/provider/scanned_product_provider.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../ingredient_search_feature/ingredient_details.dart';
import '../main.dart';
import '../provider/ingredient_provider.dart';
import '../utilities/bottom_app_bar.dart';

class IngredientsList extends StatefulWidget {
  final List<String> ingredientName;
  const IngredientsList({Key? key, required this.ingredientName})
      : super(key: key);

  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController productName_controller= TextEditingController();

  List<Ingredient> ingredientList = [];

  Future<List<Ingredient>> ExtractIngredientInfo(
      context, List<String> ingredientName) async {
    Provider.of<IngredientProvider>(context, listen: false)
        .ingredientList
        .clear();
    for (String name in ingredientName) {
      //print(name);
      await Provider.of<IngredientProvider>(context, listen: false)
          .getIngredientInfo(name);
    }
    ingredientList =
        await Provider.of<IngredientProvider>(context, listen: false)
            .ingredientList;
    print("here");
    return ingredientList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Ingredient List'),
      // bottomNavigationBar: BottomBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ReemKufi_Green_Bold(
                textValue: 'Ingredients:', size: displayHeight(context) * 0.04),
            FutureBuilder(
                future: ExtractIngredientInfo(context, widget.ingredientName),
                builder: (context, AsyncSnapshot<List<Ingredient>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    //print("here ak lle");
                    print(snapshot.data?.length);
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            print(snapshot.data?.length);
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => IngredientDetails(
                                        ingredient: snapshot.data![index])));
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReemKufi_Green_Italic(
                                            textValue: snapshot
                                                .data![index].ingredientName,
                                            size:
                                                displayHeight(context) * 0.02),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        IngredientDetails(
                                                            ingredient: snapshot
                                                                .data![index]),
                                                  ));
                                            },
                                            icon: Icon(
                                                Icons.arrow_forward_rounded)),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    );
                  }
                }),
            ElevatedButton(
              onPressed: () async {
                return showDialog(
                    barrierDismissible: false,
                    context: context, // user must tap button!
                    builder: (context) {
                print("are u working");

                 return  Form(
                   key: _formKey,
                   child: AlertDialog(
                      backgroundColor: const Color(0xff283618),
                      title: ReemKufiOffwhite(textValue: 'Enter product name',
                        size: displayHeight(context) * 0.04,),
                      content: TextFormField(
                        controller: productName_controller,
                        validator:  (productName){
                          if (productName_controller.text.isEmpty) {
                            print("validated");
                            return "* Required";
                          }
                          else {
                            return null;
                          }
                        },

                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Enter product name',
                          hintStyle: GoogleFonts.reemKufi(
                              color: Color(0xffFFFDF4),
                              fontSize: displayHeight(context) * 0.03),
                        ),
                        style: GoogleFonts.reemKufi(
                            color: Color(0xffFFFDF4),
                            fontSize: displayHeight(context) * 0.03),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.all(displayHeight(context) * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xffBBBD88)),
                                child: ReemKufi_Black(textValue: 'Add',
                                  size: displayHeight(context) * 0.03,),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {

                                    Provider.of<ScannedProductProvider>(context, listen: false).storeScannedProduct(ScannedProduct(
                                        productName: productName_controller.text,
                                        ingredientList: ingredientList));
                                  }

                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xffBBBD88)),
                                child: ReemKufi_Black(textValue: 'Cancel',
                                  size: displayHeight(context) * 0.03,),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MyBottomAppBar(),
                                    ),
                                        (route) => false,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                 );
    });

                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => CategoriesAndSearch()));
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(width: displayWidth(context) * 0.2),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                primary: Color(0xFF283618),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child: Text('Add to Scanned Products',
                  style:
                      GoogleFonts.reemKufi(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
