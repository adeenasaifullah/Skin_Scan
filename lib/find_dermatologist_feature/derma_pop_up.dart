import 'package:flutter/material.dart';
import '../utilities/utility.dart';
import 'locations.dart' as locations;

class DermaPopUp extends StatefulWidget {
  const DermaPopUp({Key? key}) : super(key: key);

  @override
  _DermaPopUpState createState() => _DermaPopUpState();
}

class _DermaPopUpState extends State<DermaPopUp> {
  //List<locations.Locations> areaList = [];
  List<String> areaList = [];
  String dropdownValue = 'One';
  late TextEditingController derma_controller;

  void initState() {
    super.initState();
    derma_controller = TextEditingController();
    getLocations();
  }

  Future<void> getLocations() async {
    final googleOffices = await locations.getGoogleOffices();
    print(googleOffices);
    for(var area in googleOffices) {
      print(area);
      print(area.areaName);
      areaList.add(area.areaName);
      //selectedLocation = area;
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
        title: ReemKufiOffwhite(textValue: 'Select your area',size: displayHeight(context)*0.04, ),
        // content: TextField(
        //   controller: derma_controller,
        //   autofocus: true,
        //   decoration: InputDecoration(
        //     hintText: 'Enter your area',
        //     hintStyle: GoogleFonts.reemKufi(
        //         color: Color(0xffFFFDF4),
        //         fontSize: displayHeight(context) * 0.03),
        //   ),
        //   style: GoogleFonts.reemKufi(
        //       color: Color(0xffFFFDF4),
        //       fontSize: displayHeight(context) * 0.03),
        // ),
        actions: <Widget>[
          Padding(
            padding:
            EdgeInsets.all(displayHeight(context) * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    },
                    items: areaList
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          );
                        }).toList(),
                ),
                                // TextButton(
                //   style: TextButton.styleFrom(
                //       backgroundColor: Color(0xffBBBD88)),
                //   child: ReemKufi_Black(textValue: 'Yes', size: displayHeight(context)*0.03,),
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => MapDemo(),
                //         ));
                //   },
                // ),
                // TextButton(
                //   style: TextButton.styleFrom(
                //       backgroundColor: Color(0xffBBBD88)),
                //   child: ReemKufi_Black(textValue: 'Cancel', size: displayHeight(context)*0.03,),
                //   onPressed: () {
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //         builder: (BuildContext context) => MyBottomAppBar(),
                //       ),
                //           (route) => false,
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}