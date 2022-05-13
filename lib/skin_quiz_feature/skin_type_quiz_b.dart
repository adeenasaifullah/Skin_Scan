import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/skin_quiz_feature/skinQuizAlgo.dart';
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
      appBar: AppBarDetails(screenName: ''),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const questions(
                    qnumber: 'Question 2',
                    question: 'When does your skin look red?',
                    description:
                    'Different climates and environments call for \n different approaches to skincare.'),
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Whenever I use new products'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Only around my cheeks'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'When I have blemishes'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Very often'),
            SizedBox(height: displayHeight(context) * 0.03),
            //   const place(typeOfPlace: 'Rainy and Moist Weather'),
            //   SizedBox(height: displayHeight(context) * 0.03),
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
        buttonText: typeOfPlace, onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => skinTypeQuizc()));
          Provider.of<skinQuizProvider>(context, listen: false).options.add(typeOfPlace);
        });

  }
}