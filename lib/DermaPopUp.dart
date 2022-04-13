import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screenSizes.dart';
import 'MyBottomAppBar.dart';
import 'map_demo.dart';


class DermaPopUp extends StatefulWidget {
  const DermaPopUp({Key? key}) : super(key: key);

  @override
  _DermaPopUpState createState() => _DermaPopUpState();
}

class _DermaPopUpState extends State<DermaPopUp> {

  late TextEditingController derma_controller;

  void initState() {
    super.initState();
    derma_controller = TextEditingController();
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
        title: ReemKufiOffwhite(textValue: 'Enter your area to find dermatologists', size: displayHeight(context) * 0.04  ),


        content: TextField(
          autofocus: false,
          controller: derma_controller,
          //autofocus: true,
          decoration: InputDecoration(
            hintText: 'Enter your area',
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
                  child: ReemKufi_Black(textValue: 'Continue', size: displayHeight(context) * 0.03),

                  onPressed: () {
                    Navigator.push(
                        context,


                        MaterialPageRoute(
                          builder: (context) => MapDemo(),
                        ));
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xffBBBD88)),
                  child: ReemKufi_Black(textValue: 'Cancel',size:displayHeight(context) * 0.03 ),

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