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
import '../provider/user_provider.dart';
import '../utilities/bottom_app_bar.dart';

class IngredientsList extends StatefulWidget {
  //final List<String> ingredientName;
  final List<Ingredient> IngredientList;
  const IngredientsList({Key? key, required this.IngredientList})
      : super(key: key);

  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  late List<Ingredient> ingredientList;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController productName_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: 'Ingredient List'),
      // bottomNavigationBar: BottomBar(),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.04),
                child: TextFormField(
                    controller: productName_controller,
                    validator: (productName) {
                      if (productName_controller.text.isEmpty) {
                        print("validated");
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
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
                  textValue: 'Ingredients:',
                  size: displayHeight(context) * 0.04),
              // IngredientListView(
              //     ingredientName: widget.ingredientName,
              //     ingredientList: (value) {
              //       ingredientList = value;
              //     }),
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<UserProvider>(context, listen: false)
                        .storeScannedProduct(ScannedProduct(
                            productName: productName_controller.text,
                            ingredientList: widget.IngredientList));
                    showDialog(
                      barrierDismissible: false,
                      context: context, // user must tap button!
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xff283618),
                          title: Column(
                            children: [
                              ReemKufiOffwhite(textValue: 'Product Added', size: displayHeight(context) * 0.04),
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
                                              fontSize:
                                              displayHeight(context) *
                                                  0.03)),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
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
                  // showDialog(
                  //   barrierDismissible: false,
                  //   context: context, // user must tap button!
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       backgroundColor: const Color(0xff283618),
                  //       title: Column(
                  //         children: [
                  //           ReemKufiOffwhite(textValue: 'Added to Scanned Product', size: displayHeight(context) * 0.04),
                  //         ],
                  //       ),
                  //       actions: <Widget>[
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Row(
                  //             mainAxisAlignment:
                  //             MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               TextButton(
                  //                 style: TextButton.styleFrom(
                  //                     backgroundColor: Color(0xffFFFDF4)),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 18.0),
                  //                   child: Text('OK',
                  //                       style: GoogleFonts.reemKufi(
                  //                           color: Colors.black,
                  //                           fontSize:
                  //                           displayHeight(context) *
                  //                               0.03)),
                  //                 ),
                  //                 onPressed: () {
                  //                   Provider.of<ScannedProductProvider>(context, listen: false).storeScannedProduct(ScannedProduct(
                  //                       productName: productName_controller.text,
                  //                       ingredientList: ingredientList));
                  //                   Navigator.pushAndRemoveUntil(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (BuildContext context) => IngredientsList( ingredientName: widget.ingredientName),
                  //                     ),
                  //                         (route) => false,
                  //                   );
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
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
                    style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientListView extends StatefulWidget {
  final Function(List<Ingredient>) ingredientList;

  final List<String> ingredientName;
  const IngredientListView(
      {Key? key, required this.ingredientName, required this.ingredientList})
      : super(key: key);

  @override
  _IngredientListViewState createState() => _IngredientListViewState();
}

class _IngredientListViewState extends State<IngredientListView> {
  late List<Ingredient> ingredientList;
  List<String> distinctIngredientName= [];

  void RemoveDuplicates(){
    print('length:'  + widget.ingredientName.length.toString());
    distinctIngredientName = widget.ingredientName.toSet().toList();
    print('length:' + distinctIngredientName.length.toString());
  }
  Future<List<Ingredient>> ExtractIngredientInfo(context, List<String> ingredientName) async {
    RemoveDuplicates();
    Provider.of<IngredientProvider>(context, listen: false)
        .ingredientList
        .clear();
    for (String name in distinctIngredientName) {
      //print(name);
      await Provider.of<IngredientProvider>(context, listen: false)
          .getIngredientInfo(name);
    }
    ingredientList =
        await Provider.of<IngredientProvider>(context, listen: false)
            .ingredientList;
    //print("here");
    return ingredientList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ExtractIngredientInfo(context, widget.ingredientName),
        builder: (context, AsyncSnapshot<List<Ingredient>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            print("Extraction Complete");
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReemKufi_Green_Italic(
                                    textValue:
                                        snapshot.data![index].ingredientName,
                                    size: displayHeight(context) * 0.02),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                IngredientDetails(
                                                    ingredient:
                                                        snapshot.data![index]),
                                          ));
                                    },
                                    icon: Icon(Icons.arrow_forward_rounded)),
                              ],
                            ),
                          )),
                    );
                  }),
            );
          }
        });
  }
}
