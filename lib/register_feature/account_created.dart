import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../skin_quiz_feature/skin_type_quiz_a.dart';
import '../utilities/utility.dart';

class accountCreated extends StatefulWidget {
  const accountCreated({Key? key}) : super(key: key);

  @override
  _accountCreatedState createState() => _accountCreatedState();
}

class _accountCreatedState extends State<accountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: const AppBarDetails(screenName: ''),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.05),
          child: Padding(
            padding: EdgeInsets.all(displayHeight(context) * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: displayHeight(context) * 0.5),
                ReemKufi_Grey_Center(
                    textValue: 'Welcome!', size: displayWidth(context) * 0.1),
                SizedBox(height: displayHeight(context) * 0.05),
                ReemKufi_Grey_Center(
                    textValue: 'Congrats!',
                    size: displayHeight(context) * 0.04),
                SizedBox(height: displayHeight(context) * 0.05),
                ReemKufi_Grey_Center(
                    textValue: 'Your account has been created.',
                    size: displayHeight(context) * 0.04),
                SizedBox(height: displayHeight(context) * 0.1),
                Rambla_Grey_Center(
                    textValue:
                        'Continue to take a quiz to identify your skin type.',
                    size: displayHeight(context) * 0.03),
                SizedBox(height: displayHeight(context) * 0.1),
                Flexible(
                  child: GreenButton(
                    buttonHeight: displayHeight(context) * 0.08,
                    buttonWidth: displayWidth(context) * 0.4,
                    textSize: displayHeight(context) * 0.03,
                    buttonText: 'Continue',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => skinTypeQuiz()));
                    },
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
