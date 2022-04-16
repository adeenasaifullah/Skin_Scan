import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:custom_top_navigator/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/MyProfile.dart';
import 'package:skin_scan/registerAndQuiz.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:skin_scan/viewRoutines.dart';
import 'DermaPopUp.dart';
import 'scan.dart';
import 'ingredientDetails.dart';
import 'HomePage.dart';
import 'map_demo.dart';


class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {

  TextEditingController ingredient_controller = TextEditingController();
  void dispose()
  {
    ingredient_controller.dispose();
  }
  int curindex = 0;

  List<Widget>screens =[ HomePageScreen(),
    DermaPopUp(),
    ViewRoutine(),
    CameraApp(),
    IngredientPopUp(),
    MyProfile()];


  void ontapped (int index)
  {
    setState(() {
      curindex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      body:  SafeArea(child: IndexedStack(
        index: curindex,
        children: screens,
      ),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff4D4D4D),
        iconSize:  displayHeight(context) * 0.05,
        onTap: ontapped,

        currentIndex: curindex,
        items: [
          const BottomNavigationBarItem(
            backgroundColor: const Color(0xff4D4D4D),
            icon: Icon(
              Icons.home_rounded,
              color: Color(0xffDADBC6),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff4D4D4D),
            icon: Image.asset(
              'assets/dermatologistIcon.png',
              height: 40,
              width: 40,
            ),
            label: 'Dermatologists',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff4D4D4D),
            icon: Image.asset(
              'assets/notepadthingyicon.png',
              height: 40,
              width: 40,
            ),
            label: 'Routines',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff4D4D4D),
            icon: Image.asset(
              'assets/ScanIcon.png',
              height: 40,
              width: 40,
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff4D4D4D),
            icon: Image.asset(
              'assets/molecularICON.png',
              height: 40,
              width: 40,
            ),
            label: 'Ingredient',
          ),
          const BottomNavigationBarItem(

            backgroundColor: const Color(0xff4D4D4D),
            icon: Icon(
              CupertinoIcons.person,

              color: Color(0xffDADBC6),

            ),
            label: 'Profile',
          ),
        ],



      ),
    );
  }
}



class IngredientPopUp extends StatefulWidget {
  const IngredientPopUp({Key? key}) : super(key: key);



  @override
  _IngredientPopUpState createState() => _IngredientPopUpState();
}

class _IngredientPopUpState extends State<IngredientPopUp> {

  TextEditingController  ingredient_controller = TextEditingController();

  void dispose()
  {
    ingredient_controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AlertDialog(
    backgroundColor: const Color(0xff283618),
    title: ReemKufiOffwhite(textValue: 'Enter your ingredient',size: displayHeight(context)*0.04, ),
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
    child: ReemKufi_Black(textValue: 'Continue', size: displayHeight(context)*0.03,),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    IngredientDetails(
    ingredientName:
    ingredient_controller.text,
    ),
    ));
    },
    ),
    TextButton(
    style: TextButton.styleFrom(
    backgroundColor: Color(0xffBBBD88)),
    child: ReemKufi_Black(textValue: 'cancel', size: displayHeight(context)*0.03,),
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
    )
    );
  }
}




