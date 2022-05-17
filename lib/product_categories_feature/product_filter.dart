import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/product_categories_feature/category_product_list.dart';
import 'package:skin_scan/provider/product_provider.dart';
import 'package:skin_scan/utilities/utility.dart';

import '../entities/product_entities.dart';
import '../main.dart';
import '../provider/search_provider.dart';

class Filter extends StatefulWidget {
  String categoryTitle;
  List<Product> listOfCategoryProducts;

  Filter(
      {Key? key,
      required this.listOfCategoryProducts,
      required this.categoryTitle})
      : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var items = ['No filter', '<=3000', '>3000 & <=5000', '>5000'];
  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false)
        .makeCopy(widget.listOfCategoryProducts);
    return Scaffold(
        appBar: const AppBarDetails(screenName: 'Filter'),
        backgroundColor: Color(0xFFFFFDF4),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.08),
                child: ReemKufi_Green(
                    textValue: 'Price Range',
                    size: displayHeight(context) * 0.04),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xffDADBC6),
                  ),
                  width: displayWidth(context) * 0.8,
                  //color: Color(0xffDADBC6),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      //menuMargin: EdgeInsets.zero,
                      menuMaxHeight: displayHeight(context) * 0.2,
                      isExpanded: true,
                      dropdownColor: Color(0xffDADBC6),
                      value: Provider.of<SearchProvider>(context, listen: false)
                          .dropdownvalue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      icon: const Icon(Icons.arrow_downward_sharp),
                      underline: const DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffDADBC6)),
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ReemKufi_Green(
                                textValue: items,
                                size: displayHeight(context) * 0.03),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          Provider.of<SearchProvider>(context, listen: false)
                              .changeDropDownValue(newValue!);
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: ReemKufi_Green(
                    textValue: 'Sort By', size: displayHeight(context) * 0.04),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.06),
                child: Row(
                  children: <Widget>[
                    const FilterButtons(
                        widthSize: 0.25,
                        heightSize: 0.06,
                        buttonText: 'Rating',
                        textSize: 0.03),
                    SizedBox(width: displayWidth(context) * 0.06),
                    const FilterButtons(
                        widthSize: 0.25,
                        heightSize: 0.06,
                        buttonText: 'Price',
                        textSize: 0.03),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.15),
              Align(
                alignment: Alignment.bottomCenter,
                child: GreenButton(
                  buttonHeight: displayHeight(context) * 0.06,
                  buttonWidth: displayWidth(context) * 0.25,
                  buttonText: "Save",
                  textSize: displayHeight(context) * 0.03,
                  onPressed: () async {
                    return showDialog(
                      barrierDismissible: false,
                      context: context, // user must tap button!
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xff283618),
                          title: ReemKufiOffwhite(
                              textValue: 'Do you want to save changes?',
                              size: displayHeight(context) * 0.04),
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
                                      child: ReemKufi_Black(
                                          textValue: 'Yes',
                                          size: displayHeight(context) * 0.03),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                      Navigator.of(context).pop(true);
                                      Navigator.of(context).pop(true);
                                      Provider.of<SearchProvider>(context, listen: false)
                                          .filterAccToPrice(
                                              Provider.of<SearchProvider>(
                                                      context,
                                                      listen: false)
                                                  .dropdownvalue,
                                              Provider.of<ProductProvider>(
                                                      context,
                                                      listen: false)
                                                  .getProductsOfCategory(
                                                      widget.categoryTitle));
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoryProducts(
                                                    categoryTitle:
                                                        widget.categoryTitle,
                                                  )));
                                      print(Provider.of<SearchProvider>(context,
                                              listen: false)
                                          .dropdownvalue);
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
                ),
              ),
            ],
          ),
        ));
  }
}

class FilterButtons extends StatefulWidget {
  final String buttonText;
  final double textSize;
  final double widthSize;
  final double heightSize;
  const FilterButtons(
      {Key? key,
      required this.widthSize,
      required this.heightSize,
      required this.buttonText,
      required this.textSize})
      : super(key: key);

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  bool color4button = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          color4button = !color4button;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(displayWidth(context) * widget.widthSize,
              displayHeight(context) * widget.heightSize),
          primary: !color4button ? Color(0xffDADBC6) : Color(0xff738A58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: ReemKufi_Green(
            textValue: widget.buttonText,
            size: displayHeight(context) * widget.textSize));
  }
}
