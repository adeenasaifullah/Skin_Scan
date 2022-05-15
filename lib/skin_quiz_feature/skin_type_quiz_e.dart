import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/log_in_sign_up_feature/home_page_screen.dart';
import 'package:skin_scan/skin_quiz_feature/skinQuizAlgo.dart';
import 'package:skin_scan/skin_quiz_feature/skin_quiz_feature_utility.dart';
import 'package:skin_scan/utilities/bottom_app_bar.dart';
import '../utilities/utility.dart';


class skinTypeQuize extends StatefulWidget {
  const skinTypeQuize({Key? key}) : super(key: key);

  @override
  _skinTypeQuizeState createState() => _skinTypeQuizeState();
}

class _skinTypeQuizeState extends State<skinTypeQuize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: displayWidth(context) * 0.03,
              right: displayWidth(context) * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              questions(
                  qnumber: 'Question 5',
                  question: 'In the afternoon, my skin needs: ',
                  description:
                  ''),
              SizedBox(height: displayHeight(context) * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Blotting or powder all over'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Spritz of facial spray'),
                ],
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const selectAge(ageBracket: 'Blotting or powder on forehead/nose/chin'),
                  SizedBox(width: displayWidth(context) * 0.1),
                  const selectAge(ageBracket: 'Loads of moisturizer'),
                ],
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
    return LightGreenButton(buttonWidth:displayWidth(context) * 0.31 ,
        buttonHeight: displayHeight(context) * 0.20,
        textSize: displayHeight(context) * 0.025, buttonText: ageBracket,
        onPressed: () async
        {

          Provider.of<SkinQuizProvider>(context, listen: false).options.add(ageBracket);
          String skinType = context.read<SkinQuizProvider>().determineSkinType();

          return showDialog(
            barrierDismissible: false,
            context: context, // user must tap button!
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color(0xff283618),
                title: ReemKufi_OffWhite_Center(
                    textValue: 'Your Skin Type is: ${skinType}',
                    size: displayHeight(context) * 0.04),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(displayHeight(context) * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xffFFFDF4)),
                          child: ReemKufi_Black(
                              textValue: 'OK',
                              size: displayHeight(context) * 0.03),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MyBottomAppBar(),
                              ),
                                  (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        });

  }
}