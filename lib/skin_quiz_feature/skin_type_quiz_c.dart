import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/skin_quiz_feature/skinQuizAlgo.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import 'package:skin_scan/skin_quiz_feature/skin_type_quiz_d.dart';
//import 'skin_quiz_feature/skin_quiz_feature_utility.dart';
import '../utilities/utility.dart';
import 'skin_type_quiz_b.dart';
import '../main.dart';


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
      appBar: AppBarDetails(screenName: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: displayWidth(context) * 0.03,
              right: displayWidth(context) * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              questions(
                  qnumber: 'Question 3',
                  question: 'How shiny is your skin?',
                  description: ''),
              SizedBox(height: displayHeight(context) * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Shiny in my T-zone only'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Bright like a diamond'),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Dull everywhere'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'More stingy than shiny'),
                ],
              ),
              //SizedBox(height: displayHeight(context) * 0.07),
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: displayWidth(context) * 0.2,
              //       right: displayWidth(context) * 0.2),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       const selectAge(ageBracket: '45-54'),
              //       SizedBox(width: displayWidth(context) * 0.1),
              //       const selectAge(ageBracket: '55+'),
              //     ],
              //   ),
              // ),
              // SizedBox(height: displayHeight(context) * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

class selectAge extends StatelessWidget {
  final String ageBracket;

  const selectAge({
    Key? key,
    required this.ageBracket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LightGreenButton(buttonWidth:displayWidth(context) * 0.35,
        buttonHeight: displayHeight(context) * 0.15,
        textSize: displayHeight(context) * 0.025, buttonText: ageBracket, onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => skinTypeQuizd()));
          Provider.of<SkinQuizProvider>(context, listen: false).options.add(ageBracket);
        });

  }
}