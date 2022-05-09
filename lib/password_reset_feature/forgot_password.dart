import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/main.dart';
import 'package:skin_scan/services/auth.dart';
import '../utilities/utility.dart';
import 'reset_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  // String email= "";
  final bool obscureIcon = false;

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: "Forgot Password?"),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    if (emailController.text.isEmpty) {
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
                  textController: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_sharp, color: Color(0xFF283618)),
                  autoFocus: false,
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                GreenButton(
                  buttonText: 'Send',
                  textSize: displayHeight(context) * 0.03,
                  buttonHeight: displayHeight(context) * 0.08,
                  buttonWidth: displayWidth(context) * 0.7,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      resetPassword();
                      return showDialog(
                        barrierDismissible: false,
                        context: context, // user must tap button!
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xff283618),
                            title: Text(
                                'You have been sent a link to reset password.',
                                style: GoogleFonts.reemKufi(
                                    color: Color(0xffFFFDF4),
                                    fontSize: displayHeight(context) * 0.04)),
                            actions: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    displayHeight(context) * 0.03),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffFFFDF4)),
                                  child: Text('Ok',
                                      style: GoogleFonts.reemKufi(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.03)),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      print("Supple a valid email.");
                    }

                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => ResetPassword()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //String message = "";

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } catch (e) {
      //Fluttertoast.showToast(msg: e!.message);
      print(e);
      return null;
    }
  }
}
