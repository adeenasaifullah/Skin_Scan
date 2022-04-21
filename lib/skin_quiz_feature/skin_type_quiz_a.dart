import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import 'package:skin_scan/skin_quiz_feature/skin_type_quiz_b.dart';
import '../main.dart';
import '../utilities/utility.dart';


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
      appBar: const AppBarDetails(screenName: 'Skin Type Quiz'),
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
                  question: 'Which age range do you fall into?',
                  description:
                  'Depending on your age, you may have specific concerns that might be relevant'),
              SizedBox(height: displayHeight(context) * 0.05),
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.2,
                    right: displayWidth(context) * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const selectAge(ageBracket: '<=17'),
                    SizedBox(width: displayWidth(context) * 0.1),
                    const selectAge(ageBracket: '18-24'),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.2,
                    right: displayWidth(context) * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const selectAge(ageBracket: '25-34'),
                    SizedBox(width: displayWidth(context) * 0.1),
                    const selectAge(ageBracket: '35-44'),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.2,
                    right: displayWidth(context) * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const selectAge(ageBracket: '45-54'),
                    SizedBox(width: displayWidth(context) * 0.1),
                    const selectAge(ageBracket: '55+'),
                  ],
                ),
              ),
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
    return LightGreenButton(buttonWidth:displayWidth(context) * 0.22 ,
        buttonHeight: displayHeight(context) * 0.10,
        textSize: displayHeight(context) * 0.025, buttonText: ageBracket, onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => skinTypeQuizb()));
        });

  }
}