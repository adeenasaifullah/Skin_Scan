import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/ingredient_scan_feature/ocr_scan.dart';
import 'package:skin_scan/profile_feature/my_profile.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../entities/ingredient_entities.dart';
import '../find_dermatologist_feature/derma_pop_up.dart';
import '../ingredient_scan_feature/ingredient_scan.dart';
import '../ingredient_search_feature/ingredient_details.dart';
import '../ingredient_search_feature/ingredient_popup.dart';
import '../log_in_sign_up_feature/home_page_screen.dart';
import '../log_in_sign_up_feature/log_in_screen.dart';
import '../provider/ingredient_provider.dart';
import '../routine_feature/view_routine.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  late TextEditingController ingredient_controller = TextEditingController();

  void initState() {
    super.initState();
    ingredient_controller = TextEditingController();
  }

  void dispose() {
    ingredient_controller.dispose();
    super.dispose();
  }

  int curindex = 0;

  List<Widget> screens = [
    HomePageScreen(),
    DermaPopUp(),
    ViewRoutine(),
    OcrScan(),
    IngredientPopUp(),
    MyProfile()
  ];

  void ontapped(int index) {
    setState(() {
      curindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //FocusScope.of(context).unfocus();
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: curindex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff4D4D4D),
        iconSize: displayHeight(context) * 0.05,
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
