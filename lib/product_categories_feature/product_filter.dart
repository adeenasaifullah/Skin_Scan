import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/utilities/utility.dart';

import '../main.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  //String dropdownValue = '15-25';
  //var items = ['15-25', '26-35', '36-45', '46-55', '56+'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDetails(screenName: 'Filter'),
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
              Row(
                //DADBC6
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FilterButtons(
                      widthSize: 0.22,
                      heightSize: 0.08,
                      buttonText: '<1000',
                      textSize: 0.02),
                  FilterButtons(
                      widthSize: 0.22,
                      heightSize: 0.08,
                      buttonText: '>1000 <5000',
                      textSize: 0.02),
                  FilterButtons(
                      widthSize: 0.22,
                      heightSize: 0.08,
                      buttonText: '>5000',
                      textSize: 0.02),
                ],
              ),
              //SizedBox(height: displayHeight(context) * 0.02),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: displayWidth(context) * 0.06),
              //   child: ReemKufi_Green(
              //       textValue: 'Age', size: displayHeight(context) * 0.04),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: displayWidth(context) * 0.06),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //       color: Color(0xffDADBC6),
              //     ),
              //
              //     width: displayWidth(context) * 0.3,
              //     //color: Color(0xffDADBC6),
              //     child: ButtonTheme(
              //       alignedDropdown: true,
              //       child: DropdownButton(
              //         //menuMargin: EdgeInsets.zero,
              //         menuMaxHeight: displayHeight(context) * 0.2,
              //
              //         isExpanded: true,
              //         dropdownColor: Color(0xffDADBC6),
              //         value: dropdownValue,
              //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //         icon: const Icon(Icons.arrow_downward_sharp),
              //
              //         underline: DecoratedBox(
              //           decoration: BoxDecoration(color: Color(0xffDADBC6)),
              //         ),
              //         items: items.map((String items) {
              //           return DropdownMenuItem(
              //             value: items,
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: ReemKufi_Green(
              //                   textValue: items,
              //                   size: displayHeight(context) * 0.03),
              //             ),
              //           );
              //         }).toList(),
              //         onChanged: (String? newValue) {
              //           setState(() {
              //             dropdownValue = newValue!;
              //           });
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: displayHeight(context) * 0.03),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: displayWidth(context) * 0.06),
              //   child: ReemKufi_Green(
              //       textValue: 'Gender', size: displayHeight(context) * 0.04),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: displayWidth(context) * 0.06),
              //   child: Row(
              //     //DADBC6
              //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       FilterButtons(
              //           widthSize: 0.25,
              //           heightSize: 0.06,
              //           buttonText: 'Male',
              //           textSize: 0.03),
              //       SizedBox(width: displayWidth(context) * 0.06),
              //       FilterButtons(
              //           widthSize: 0.28,
              //           heightSize: 0.06,
              //           buttonText: 'Female',
              //           textSize: 0.03),
              //     ],
              //   ),
              // ),
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
                    FilterButtons(
                        widthSize: 0.25,
                        heightSize: 0.06,
                        buttonText: 'Rating',
                        textSize: 0.03),
                    SizedBox(width: displayWidth(context) * 0.06),
                    FilterButtons(
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
                child: GreenButton(buttonHeight: displayHeight(context) * 0.06,
                  buttonWidth: displayWidth(context) * 0.25, buttonText:"Save" ,
                  textSize:displayHeight(context) * 0.03 , onPressed: () async {return showDialog(
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
                                        size:
                                        displayHeight(context) * 0.03),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
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
                  ); },),

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