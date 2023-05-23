import 'package:skin_scan/entities/location_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/provider/location_provider.dart';
import '../utilities/bottom_app_bar.dart';
import '../utilities/utility.dart';
import 'map_demo.dart';

class DermaPopUp extends StatefulWidget {
  const DermaPopUp({Key? key}) : super(key: key);

  @override
  _DermaPopUpState createState() => _DermaPopUpState();
}

class _DermaPopUpState extends State<DermaPopUp> {
  var areaList = ['Select your area'];
  List<Location> locationList = [];
  late TextEditingController derma_controller;
  var dropdownValue = 'Select your area';
  int selectedIndex = 0;

  void initState() {
    super.initState();
    derma_controller = TextEditingController();
    getLocations();
  }

  Future getLocations() async {
    await Provider.of<LocationProvider>(context, listen: false).getLocation();
    locationList = await Provider.of<LocationProvider>(context, listen: false)
        .locationList;
    for (var area in locationList) {
      areaList.add(area.areaName);
    }
  }

  void dispose() {
    derma_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: const Color(0xff283618),
        title: ReemKufiOffwhite(
          textValue: 'Select your area',
          size: displayHeight(context) * 0.04,
        ),
        actions: <Widget>[
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color(0xffDADBC6),
              ),
              width: displayWidth(context) * 0.75,
              child: ButtonTheme(
                alignedDropdown: true,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButton(
                      menuMaxHeight: displayHeight(context) * 0.2,
                      isExpanded: true,
                      dropdownColor: Color(0xffDADBC6),
                      value: dropdownValue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      icon: const Icon(Icons.arrow_downward_sharp),
                      underline: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffDADBC6)),
                      ),
                      items: areaList.map((String items) {
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
                          selectedIndex = areaList.indexOf(newValue!);
                          dropdownValue = newValue!;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(displayHeight(context) * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xffBBBD88)),
                  child: ReemKufi_Black(
                    textValue: 'Continue',
                    size: displayHeight(context) * 0.03,
                  ),
                  onPressed: () {
                    if (selectedIndex == 0) {
                      showDialog(
                        barrierDismissible: false,
                        context: context, // user must tap button!
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xff283618),
                            title: Column(
                              children: [
                                ReemKufiOffwhite(
                                    textValue: 'Area not selected',
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
                                                fontSize:
                                                    displayHeight(context) *
                                                        0.03)),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // Navigator.pushAndRemoveUntil(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (BuildContext context) =>
                                        //         DermaPopUp(),
                                        //   ),
                                        //   (route) => false,
                                        // );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapDemo(
                                selectedLocation:
                                    locationList[selectedIndex - 1]),
                          ));
                    }
                  },
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xffBBBD88)),
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
      ),
    );
  }
}
