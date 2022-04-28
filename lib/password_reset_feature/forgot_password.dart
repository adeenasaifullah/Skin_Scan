import 'package:flutter/material.dart';
import 'package:skin_scan/main.dart';
import '../utilities/utility.dart';
import 'reset_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email= "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: "Forgot Password?"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: ReemKufi_Green_Bold(
                      textValue:
                          "Forgot your password? Don’t worry? \n Just enter your email to receive\n a link to reset your password.",
                      size: displayHeight(context) * 0.025)),
              SizedBox(height: displayHeight(context) * 0.05),
              field(
                validateInput: (email) {
                  if (email!.isEmpty) {
                    return "* Required";
                  }
                  if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email!)) {
                    return "Enter correct email address";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_sharp, color: Color(0xFF283618)),
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              GreenButton(
                buttonText: 'Send',
                textSize: displayHeight(context) * 0.03,
                buttonHeight: displayHeight(context) * 0.08,
                buttonWidth: displayWidth(context) * 0.7,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResetPassword()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
