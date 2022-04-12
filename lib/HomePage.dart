import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/LogIn.dart';
import 'categoriesAndSearch.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:custom_top_navigator/custom_top_navigator.dart';
import 'package:skin_scan/viewRoutines.dart';
import 'main.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF384826),
                  Color(0xFF98AC80),
                  Color(0xFFFFFDF4)
                ])),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                      child: Column(
                        children: [
                          ReemKufiOffwhite(textValue: "Hello, Afzal!", size: displayHeight(context) * 0.05),
                          ReemKufiOffwhite_Italic(textValue: ' Give your skin a little love!', size: displayHeight(context) * 0.025),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.1,
                    ),
                    Image(
                        image: AssetImage('assets/dots.png'),
                        fit: BoxFit.fill,
                        height: displayHeight(context) * 0.12,
                        width: displayWidth(context) * 0.2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.75,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CategoriesAndSearch()));
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(width: displayWidth(context) * 0.2),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              primary: Color(0xFF283618),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            child: Text('Browse Categories',
                                style: GoogleFonts.reemKufi(
                                    color: Colors.white, fontSize: 20)),
                          ),


                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context)*0.05,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.logout,
                        color: Color(0xff283618),
                        size: displayWidth(context) * 0.125,
                      ),
                      onTap : () async {
                        return showDialog(
                          barrierDismissible: false,
                          context: context, // user must tap button!
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xff283618),
                              title: ReemKufiOffwhite(textValue: 'Are you sure you want to logout?', size: displayHeight(context) * 0.04,),
                              actions: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(
                                      displayHeight(context) * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                            Color(0xffFFFDF4)),
                                        child: Text('Yes',
                                            style: GoogleFonts.reemKufi(
                                                color: Colors.black,
                                                fontSize:
                                                displayHeight(context) *
                                                    0.03)),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => LogInScreen()));
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                            Color(0xffBBBD88)),
                                        child: Text('No',
                                            style: GoogleFonts.reemKufi(
                                                color: Colors.black,
                                                fontSize:
                                                displayHeight(context) *
                                                    0.03)),
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
                    )
                  ],
                ),
                SizedBox(
                  height: displayHeight(context)*0.025,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewRoutine()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        width: displayWidth(context) * 0.6,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDADBC6),
                          borderRadius:
                          BorderRadius.circular(20), //border corner radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ReemKufi_Green(textValue: 'SkinCare', size: displayHeight(context)*0.03),
                                        ReemKufi_Green(textValue: 'Routine', size: displayHeight(context)*0.03),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context)*0.15,
                                  ),
                                  InkWell(
                                    child: Icon(Icons.add_circle_outline, color: Colors.black,
                                    size: 45,),
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ViewRoutine()));
                                    },
                                  )
                                ],
                              ),
                              ReemKufi_Green_Italic(textValue: 'Maintain your schedule!', size: displayHeight(context) * 0.02),
                            ],
                          ),
                        )
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReemKufi_Green_Bold(textValue: '20th', size: displayHeight(context) * 0.025),
                        ReemKufi_Green_Bold(textValue: 'March,2022', size: displayHeight(context) * 0.025),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: displayHeight(context)*0.025,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF28361857),
                    borderRadius:
                        BorderRadius.circular(20), //border corner radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReemKufiOffwhite(textValue: 'Reminder', size: displayHeight(context) * 0.03),
                        ReemKufi_Green_Italic(textValue: 'Don’t forget to follow your evening routine!', size: displayHeight(context) * 0.02),
                        ReemKufi_Green_Bold(textValue: 'Next step:  apply Caquina Beauty moisturizer', size: displayHeight(context) * 0.02),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context)*0.025,
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF283618),
                      borderRadius:
                          BorderRadius.circular(20), //border corner radius
                    ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReemKufiOffwhite(textValue: 'Skin Log', size: displayHeight(context) * 0.03),
                          ReemKufiOffwhite(textValue: 'Tell us how has your skin been feeling today?', size: displayHeight(context) * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: Icon(Icons.sentiment_satisfied_outlined, color: Colors.white, size: 40,),
                                onTap: (){
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context, // user must tap button!
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: const Color(0xff283618),
                                        title: Column(
                                          children: [
                                            ReemKufiOffwhite(textValue: 'Skin Log', size: displayHeight(context) * 0.03),
                                            ReemKufiOffwhite(textValue: 'Thank you for filling the skin log today!', size: displayHeight(context) * 0.02),
                                            Row(
                                              children: [
                                                ReemKufiOffwhite(textValue: 'Skin Feeling: ', size: displayHeight(context)*0.02),
                                                Icon(Icons.sentiment_satisfied_outlined, color: Colors.white, size: 40,),
                                              ],
                                            )
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
                                                    Navigator.of(context).pop();
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
                              InkWell(
                                  child: Icon(Icons.sentiment_neutral_outlined, color: Colors.white, size: 40),
                                  onTap:(){
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context, // user must tap button!
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: const Color(0xff283618),
                                          title: Column(
                                            children: [
                                              ReemKufiOffwhite(textValue: 'Skin Log', size: displayHeight(context) * 0.03),
                                              ReemKufiOffwhite(textValue: 'Thank you for filling the skin log today!', size: displayHeight(context) * 0.02),
                                              Row(
                                                children: [
                                                  ReemKufiOffwhite(textValue: 'Skin Feeling: ', size: displayHeight(context)*0.02),
                                                  Icon(Icons.sentiment_neutral_outlined, color: Colors.white, size: 40,),
                                                ],
                                              )
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
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } ,
                              ),
                              InkWell(
                                child: Icon(Icons.sentiment_dissatisfied_outlined, color: Colors.white, size: 40),
                                onTap:(){
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context, // user must tap button!
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: const Color(0xff283618),
                                        title: Column(
                                          children: [
                                            ReemKufiOffwhite(textValue: 'Skin Log', size: displayHeight(context) * 0.03),
                                            ReemKufiOffwhite(textValue: 'Thank you for filling the skin log today!', size: displayHeight(context) * 0.02),
                                            Row(
                                              children: [
                                                ReemKufiOffwhite(textValue: 'Skin Feeling: ', size: displayHeight(context)*0.02),
                                                Icon(Icons.sentiment_dissatisfied_outlined, color: Colors.white, size: 40,),
                                              ],
                                            )
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
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } ,
                              ),
                            ],
                          )
                        ],
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
