import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/skin_quiz_feature/skinQuizAlgo.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import '../utilities/utility.dart';
import 'skin_type_quiz_b.dart';
import '../main.dart';

class skinTypeQuiz extends StatefulWidget {
  const skinTypeQuiz({Key? key}) : super(key: key);

  @override
  _skinTypeQuizState createState() => _skinTypeQuizState();
}

class _skinTypeQuizState extends State<skinTypeQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: ""),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: displayWidth(context) * 0.03,
              right: displayWidth(context) * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              questions(
                  qnumber: 'Question 1',
                  question: 'Which closely describes the look of your pores?',
                  description: ''),
              SizedBox(height: displayHeight(context) * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Large and Visible'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Medium Sized'),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Small/ Not noticeable'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Visible only in T-zone'),
                ],
              ),
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
        buttonWidth: displayWidth(context) * 0.30,
        buttonHeight: displayHeight(context) * 0.15,
        textSize: displayHeight(context) * 0.025,
        buttonText: ageBracket,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => skinTypeQuizb()));
          Provider.of<SkinQuizProvider>(context, listen: false)
              .options
              .add(ageBracket);
        });
  }
}
