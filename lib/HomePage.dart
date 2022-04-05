import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/screenSizes.dart';

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
                          Text("Hello, Afzal!",
                              style: GoogleFonts.reemKufi(
                                  color: Color(0xffFFFDF4),
                                  fontSize: displayHeight(context) * 0.05)),
                          Text(' Give your skin a little love!',
                              style: GoogleFonts.reemKufi(
                                  color: Color(0xffFFFDF4),
                                  fontSize: displayHeight(context) * 0.025,
                                  fontStyle: FontStyle.italic))
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
                  children: [
                    Container(
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
                                      Text('SkinCare',
                                          style: GoogleFonts.reemKufi(
                                            color: Color(0xff283618),
                                            fontSize: displayHeight(context) * 0.03,
                                          )),
                                      Text('Routine',
                                          style: GoogleFonts.reemKufi(
                                            color: Color(0xff283618),
                                            fontSize: displayHeight(context) * 0.03,
                                          )),
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

                                  },
                                )
                              ],
                            ),
                            Text('Maintain your schedule!',
                                style: GoogleFonts.reemKufi(
                                    color: Color(0xff283618),
                                    fontSize: displayHeight(context) * 0.02,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('20th',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xff283618),
                                fontSize: displayHeight(context) * 0.025,
                                fontWeight: FontWeight.bold)),
                        Text('March,2022',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xff283618),
                                fontSize: displayHeight(context) * 0.025,
                                fontWeight: FontWeight.bold)),
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
                        Text('Reminder',
                            style: GoogleFonts.reemKufi(
                              color: Color(0xffFFFDF4),
                              fontSize: displayHeight(context) * 0.03,
                            )),
                        Text('Don’t forget to follow your evening routine!',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xff283618),
                                fontSize: displayHeight(context) * 0.02,
                                fontStyle: FontStyle.italic)),
                        Text('Next step:  apply Caquina Beauty moisturizer',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xff283618),
                                fontSize: displayHeight(context) * 0.02,
                                fontWeight: FontWeight.bold))
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
                          Text('Skin Log',
                              style: GoogleFonts.reemKufi(
                                color: Color(0xffFFFDF4),
                                fontSize: displayHeight(context) * 0.03,
                              )),
                          Text('Tell us how has your skin been feeling today?',
                              style: GoogleFonts.reemKufi(
                                color: Color(0xffFFFDF4),
                                fontSize: displayHeight(context) * 0.02,
                              )),
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
                                            Text('Skin Log',
                                                style: GoogleFonts.reemKufi(
                                                  color: Color(0xffFFFDF4),
                                                  fontSize: displayHeight(context) * 0.03,
                                                )),
                                            Text('Thank you for filling the skin log today!',
                                                style: GoogleFonts.reemKufi(
                                                  color: Color(0xffFFFDF4),
                                                  fontSize: displayHeight(context) * 0.02,
                                                )),
                                            Row(
                                              children: [
                                                Text('Skin Feeling: ',
                                                    style: GoogleFonts.reemKufi(
                                                      color: Color(0xffFFFDF4),
                                                      fontSize: displayHeight(context) * 0.02,
                                                    )),
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
                                              Text('Skin Log',
                                                  style: GoogleFonts.reemKufi(
                                                    color: Color(0xffFFFDF4),
                                                    fontSize: displayHeight(context) * 0.03,
                                                  )),
                                              Text('Thank you for filling the skin log today!',
                                                  style: GoogleFonts.reemKufi(
                                                    color: Color(0xffFFFDF4),
                                                    fontSize: displayHeight(context) * 0.02,
                                                  )),
                                              Row(
                                                children: [
                                                  Text('Skin Feeling: ',
                                                      style: GoogleFonts.reemKufi(
                                                        color: Color(0xffFFFDF4),
                                                        fontSize: displayHeight(context) * 0.02,
                                                      )),
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
                                            Text('Skin Log',
                                                style: GoogleFonts.reemKufi(
                                                  color: Color(0xffFFFDF4),
                                                  fontSize: displayHeight(context) * 0.03,
                                                )),
                                            Text('Thank you for filling the skin log today!',
                                                style: GoogleFonts.reemKufi(
                                                  color: Color(0xffFFFDF4),
                                                  fontSize: displayHeight(context) * 0.02,
                                                )),
                                            Row(
                                              children: [
                                                Text('Skin Feeling: ',
                                                    style: GoogleFonts.reemKufi(
                                                      color: Color(0xffFFFDF4),
                                                      fontSize: displayHeight(context) * 0.02,
                                                    )),
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
      bottomNavigationBar: BottomBar(),
    );
  }
}
