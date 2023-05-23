import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/skin_quiz_feature/skinQuizAlgo.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import 'package:skin_scan/skin_quiz_feature/skin_type_quiz_e.dart';
import '../utilities/utility.dart';
import '../main.dart';

class skinTypeQuizd extends StatefulWidget {
  const skinTypeQuizd({Key? key}) : super(key: key);

  @override
  _skinTypeQuizdState createState() => _skinTypeQuizdState();
}

class _skinTypeQuizdState extends State<skinTypeQuizd> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              questions(
                  qnumber: 'Question 4',
                  question: 'How does it feel when you touch your skin?',
                  description: ''),
              SizedBox(height: displayHeight(context) * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Rough and scaly'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Oily in places & dry in others'),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Irritated and angry'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Slick and greasy'),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              SizedBox(height: displayHeight(context) * 0.03),
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
    return LightGreenButton(
        buttonWidth: displayWidth(context) * 0.25,
        buttonHeight: displayHeight(context) * 0.15,
        textSize: displayHeight(context) * 0.025,
        buttonText: ageBracket,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => skinTypeQuize()));
          Provider.of<SkinQuizProvider>(context, listen: false)
              .options
              .add(ageBracket);
        });
  }
}
