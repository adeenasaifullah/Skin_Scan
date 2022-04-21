import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import 'package:skin_scan/skin_quiz_feature/skin_type_quiz_c.dart';
import '../main.dart';
import '../utilities/utility.dart';

class skinTypeQuizb extends StatefulWidget {
  const skinTypeQuizb({Key? key}) : super(key: key);

  @override
  _skinTypeQuizbState createState() => _skinTypeQuizbState();
}

class _skinTypeQuizbState extends State<skinTypeQuizb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: const AppBarDetails(screenName: 'Skin Type Quiz'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const questions(
                    qnumber: 'Question 2',
                    question: 'What do you call home?',
                    description:
                    'Different climates and environments call for \n different approaches to skincare.'),
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Sunny and Humid Place'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Dry and Hot Desert'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Cold and Dry'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Cold Winters, Dry Summers'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Rainy and Moist Weather'),
            SizedBox(height: displayHeight(context) * 0.03),
          ],
        ),
      ),
    );
  }
}

class place extends StatelessWidget {
  final String typeOfPlace;

  const place({
    Key? key,
    required this.typeOfPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LightGreenButton(buttonWidth:displayWidth(context) * 0.50, buttonHeight: displayHeight(context) * 0.09,
        textSize: displayHeight(context) * 0.025,
        buttonText: typeOfPlace, onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => skinTypeQuizc()));
        });

  }
}