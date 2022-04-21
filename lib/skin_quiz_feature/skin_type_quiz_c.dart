import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import '../main.dart';
import '../utilities/bottom_app_bar.dart';
import '../utilities/utility.dart';


class skinTypeQuizc extends StatefulWidget {
  const skinTypeQuizc({Key? key}) : super(key: key);

  @override
  _skinTypeQuizcState createState() => _skinTypeQuizcState();
}

class _skinTypeQuizcState extends State<skinTypeQuizc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: 'Skin Type Quiz'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const questions(
                    qnumber: 'Question 3',
                    question:
                    'On a scale of 1 - 5, how reactive \n would you consider your skin?',
                    description: ''),
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const rating(rate: '1'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '2'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '3'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '4'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '5'),

                //SizedBox(height: displayHeight(context) * 0.05),
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: displayWidth(context) * 0.1),
                howReactiveText(text: '1- Very low reactive skin'),
                SizedBox(width: displayWidth(context) * 0.08),
                howReactiveText(text: '3- Moderately reactive skin'),
                SizedBox(width: displayWidth(context) * 0.18),
                howReactiveText(text: '5- Very reactive skin'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class rating extends StatelessWidget {
  final String rate;

  const rating({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LightGreenButton(buttonWidth:displayWidth(context) * 0.10, buttonHeight: displayHeight(context) * 0.10,
        textSize: displayHeight(context) * 0.03,
        buttonText: rate, onPressed: () async {
          return showDialog(
              barrierDismissible: false,
              context: context, // user must tap button!
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color(0xff283618),
                  title: ReemKufiOffwhite(
                    textValue: 'Thank you for submitting the quiz! \n'
                        'Your skin type is: Oily',
                    size: displayHeight(context) * 0.04,
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(displayHeight(context) * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xffBBBD88)),
                            child: ReemKufi_Black(textValue: 'OK', size: displayHeight(context) * 0.03,),
                            // Text('OK',
                            //     style: GoogleFonts.reemKufi(
                            //         color: Colors.black,
                            //         fontSize: displayHeight(context) * 0.03)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyBottomAppBar()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        });

  }
}

class howReactiveText extends StatelessWidget {
  final String text;
  const howReactiveText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child:
      Text(text,
          textAlign: TextAlign.start,
          softWrap: true,
          style: GoogleFonts.rambla(
              fontSize: displayHeight(context) * 0.015,
              color: Colors.black,
              fontStyle: FontStyle.italic)),
    );
  }
}
