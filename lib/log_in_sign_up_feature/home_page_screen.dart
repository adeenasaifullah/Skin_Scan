import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/product_categories_feature/categories_list.dart';
import 'package:skin_scan/provider/user_provider.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../entities/user_entities.dart';
import '../routine_feature/view_routine.dart';
import '../services/auth.dart';
import 'log_in_screen.dart';
import 'package:intl/intl.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final AuthService _auth = AuthService();
  DateTime time = DateTime.now();
  dynamic currentTime = DateFormat.jm().format(DateTime.now());
  List<String> quotes = [
    "Nature gives you the face you have at twenty; it is up to you to merit the face you have at fifty ― Coco Chanel.",
    "It's not just what substances you put on your skin. Inappropriate inflammation is rooted in diet, how you handle stress, how you rest, and your exposure to environmental toxins ― Andrew Weil.",
    "Invest in your skin. It is going to represent you for a very long time ― Linden Tyler",
    "What is your skin trying to tell you? Often the skin is a metaphor for deeper issues and a way for your body to send up a red flag to warn you that all is not well underneath ― Dr. Judyth Reichenberg.",
    "Beauty comes in all shapes, colors, and sizes, and when we can accept this truth, we will no longer hurt ourselves or each other for the simple things that make us human ― Gregory Landsman",
    "Beauty is about being comfortable in your own skin. It's about knowing and accepting who you are ― Ellen DeGeneres"
  ];
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    String name = context.read<UserProvider>().getCurrentUser().UserName;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF384826),
                  Color(0xFF98AC80),
                  const Color(0xFFFFFDF4)
                ])),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                      child: Column(
                        children: [
                          ReemKufiOffwhite(
                              textValue: "Hello ${name}",
                              size: displayHeight(context) * 0.035),
                          ReemKufiOffwhite_Italic(
                              textValue: 'Give your skin a little love!',
                              size: displayHeight(context) * 0.025)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.1,
                    ),
                    Image(
                        image: const AssetImage('assets/dots.png'),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: displayWidth(context) * 0.04),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoriesAndSearch()));
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  width: displayWidth(context) * 0.2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              primary: const Color(0xFF283618),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            child: ReemKufiOffwhite(
                              textValue: 'Browse Categories',
                              size: displayHeight(context) * 0.03,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.logout,
                            color: const Color(0xff283618),
                            size: displayWidth(context) * 0.125,
                          ),
                          onTap: () async {
                            return showDialog(
                              barrierDismissible: false,
                              context: context, // user must tap button!
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xff283618),
                                  title: ReemKufiOffwhite(
                                    textValue:
                                        'Are you sure you want to logout?',
                                    size: displayHeight(context) * 0.04,
                                  ),
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
                                                    const Color(0xffFFFDF4)),
                                            child: ReemKufi_Black(
                                                textValue: 'Yes',
                                                size: displayHeight(context) *
                                                    0.03),
                                            onPressed: () async {
                                              await _auth.signOut();
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext context) => LogInScreen(),
                                                ),
                                                    (route) => false,
                                              );
                                            },
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xffBBBD88)),
                                            child: ReemKufi_Black(
                                                textValue: 'No',
                                                size: displayHeight(context) *
                                                    0.03),
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
                        ReemKufi_OffWhite_Center(
                            textValue: 'Logout',
                            size: displayHeight(context) * 0.025),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: displayHeight(context) * 0.025,
                ),
                Row(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReemKufi_Green(
                                            textValue: 'SkinCare',
                                            size:
                                                displayHeight(context) * 0.03),
                                        ReemKufi_Green(
                                            textValue: 'Routine',
                                            size:
                                                displayHeight(context) * 0.03),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.15,
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.black,
                                      size: displayHeight(context) * 0.05,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewRoutine()));
                                    },
                                  )
                                ],
                              ),
                              ReemKufi_Green_Italic(
                                  textValue: 'Maintain your schedule!',
                                  size: displayHeight(context) * 0.02),
                            ],
                          ),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReemKufi_Green_Bold(
                            textValue: '${DateFormat('dd').format(time)}',
                            size: displayHeight(context) * 0.05),
                        ReemKufi_Green_Bold(
                            textValue:
                                '${DateFormat.MMMM().format(time)} ${DateFormat('yyyy').format(time)}',
                            size: displayHeight(context) * 0.025)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: displayHeight(context) * 0.025,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF28361857),
                    borderRadius:
                        BorderRadius.circular(20), //border corner radius
                  ),
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(displayWidth(context)*0.03, displayHeight(context)*0.019, displayWidth(context)*0.03, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(displayWidth(context)*0.03, 0, 0, 0),
                          child: ReemKufiOffwhite(
                              textValue: 'Reminder',
                              size: displayHeight(context) * 0.03),
                        ),
                        (time.hour.toInt() <= 14 &&
                                time.hour.toInt() >= 9 &&
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .currUser
                                    .UserRoutines[0]
                                    .listofproducts
                                    .isNotEmpty)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReemKufi_Green_Italic(
                                      textValue:
                                          'Don’t forget to follow your morning routine!',
                                      size: displayHeight(context) * 0.02),
                                  ReemKufi_Green_Bold(
                                      textValue:
                                          'Next step: apply ${Provider.of<UserProvider>(context, listen: false).currUser.UserRoutines[0].listofproducts[0].productname}',
                                      size: displayHeight(context) * 0.02)
                                ],
                              )
                            : (time.hour.toInt() >= 20 &&
                                    time.hour.toInt() <= 23 &&
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .currUser
                                        .UserRoutines[1]
                                        .listofproducts
                                        .isNotEmpty)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ReemKufi_Green_Italic(
                                          textValue:
                                              'Don’t forget to follow your night routine!',
                                          size: displayHeight(context) * 0.02),
                                      ReemKufi_Green_Bold(
                                          textValue:
                                              'Next step: apply ${Provider.of<UserProvider>(context, listen: false).currUser.UserRoutines[1].listofproducts[0].productname}',
                                          size: displayHeight(context) * 0.02),
                                    ],
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(
                                        displayWidth(context) * 0.03),
                                    child: ReemKufi_Green_Italic(
                                      textValue: quotes[random.nextInt(5)],
                                      size: displayHeight(context) * 0.02,
                                    ),
                                  )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.025,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                        ReemKufiOffwhite(
                            textValue: 'Skin Log',
                            size: displayHeight(context) * 0.03),
                        ReemKufiOffwhite(
                            textValue:
                                'Tell us how has your skin been feeling today?',
                            size: displayHeight(context) * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              child: const Icon(
                                Icons.sentiment_satisfied_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, // user must tap button!
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: const Color(0xff283618),
                                      title: Column(
                                        children: [
                                          ReemKufiOffwhite(
                                              textValue: 'Skin Log',
                                              size: displayHeight(context) *
                                                  0.03),
                                          ReemKufiOffwhite(
                                              textValue:
                                                  'Thank you for filling the skin log today!',
                                              size: displayHeight(context) *
                                                  0.02),
                                          Row(
                                            children: [
                                              ReemKufiOffwhite(
                                                  textValue: 'Skin Feeling: ',
                                                  size: displayHeight(context) *
                                                      0.02),
                                              const Icon(
                                                Icons
                                                    .sentiment_satisfied_outlined,
                                                color: Colors.white,
                                                size: 40,
                                              ),
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
                                                    backgroundColor:
                                                        const Color(
                                                            0xffFFFDF4)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: ReemKufi_Black(
                                                      textValue: 'OK',
                                                      size: displayHeight(
                                                              context) *
                                                          0.03),
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
                              child: const Icon(
                                  Icons.sentiment_neutral_outlined,
                                  color: Colors.white,
                                  size: 40),
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, // user must tap button!
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: const Color(0xff283618),
                                      title: Column(
                                        children: [
                                          ReemKufiOffwhite(
                                              textValue: "Skin Log",
                                              size: displayHeight(context) *
                                                  0.03),
                                          ReemKufiOffwhite(
                                              textValue:
                                                  'Thank you for filling the skin log today!',
                                              size: displayHeight(context) *
                                                  0.02),
                                          Row(
                                            children: [
                                              ReemKufiOffwhite(
                                                  textValue: 'Skin Feeling: ',
                                                  size: displayHeight(context) *
                                                      0.02),
                                              const Icon(
                                                Icons
                                                    .sentiment_neutral_outlined,
                                                color: Colors.white,
                                                size: 40,
                                              ),
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
                                                    backgroundColor:
                                                        const Color(
                                                            0xffFFFDF4)),
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18.0),
                                                    child: ReemKufi_Black(
                                                        textValue: 'OK',
                                                        size: displayHeight(
                                                                context) *
                                                            0.03)),
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
                              child: const Icon(
                                  Icons.sentiment_dissatisfied_outlined,
                                  color: Colors.white,
                                  size: 40),
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context, // user must tap button!
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: const Color(0xff283618),
                                      title: Column(
                                        children: [
                                          ReemKufiOffwhite(
                                              textValue: 'Skin Log',
                                              size: displayHeight(context) *
                                                  0.03),
                                          ReemKufiOffwhite(
                                              textValue:
                                                  'Thank you for filling the skin log today!',
                                              size: displayHeight(context) *
                                                  0.02),
                                          Row(
                                            children: [
                                              ReemKufiOffwhite(
                                                  textValue: 'Skin Feeling: ',
                                                  size: displayHeight(context) *
                                                      0.02),
                                              const Icon(
                                                Icons
                                                    .sentiment_dissatisfied_outlined,
                                                color: Colors.white,
                                                size: 40,
                                              ),
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
                                                    backgroundColor:
                                                        const Color(
                                                            0xffFFFDF4)),
                                                child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18.0),
                                                    child: ReemKufi_Black(
                                                        textValue: 'OK',
                                                        size: displayHeight(
                                                                context) *
                                                            0.03)),
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
