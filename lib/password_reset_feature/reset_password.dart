import 'package:flutter/material.dart';
import 'package:skin_scan/main.dart';
import '../utilities/utility.dart';
import 'new_password.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: "Reset Password?"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: ReemKufi_Green_Bold(textValue: "Hi, Afzal.", size: displayHeight(context)*0.05)
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              Container(
                  child: ReemKufi_Green_Bold(textValue: "We’ve got a request to reset your \naccount password.", size: displayHeight(context) * 0.025,)
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              GreenButton(buttonText: 'Reset Password',
                textSize: displayHeight(context)*0.03,
                buttonHeight: displayHeight(context)*0.08,
                buttonWidth: displayWidth(context) * 0.7,
                onPressed: () {  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewPassword()));},),

              SizedBox(height: displayHeight(context) * 0.05),
              Container(
                  child: ReemKufi_Green_Bold(textValue: "If you ignore this message, \nyour password will not be changed.", size: displayHeight(context) * 0.0235,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
