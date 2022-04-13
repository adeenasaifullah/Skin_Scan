import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/registerAndQuiz.dart';
import 'HomePage.dart';
import 'package:skin_scan/MyBottomAppBar.dart';
import 'package:skin_scan/main.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:flutter/services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "Log In"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon:
                  Icon(Icons.email_sharp, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.025),
              Row(
                children: [
                  SizedBox(
                    width: displayWidth(context) *0.55,
                  ),
                  Flexible(
                      child: InkWell(
                        child: ReemKufi_Green_Bold(textValue: "Forgot Password?",size: displayHeight(context)* 0.0225),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                        },
                      )
                  ),
                ]
              ),
              SizedBox(height: displayHeight(context) * 0.025),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyBottomAppBar()));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: displayWidth(context) * 0.7),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  primary: Color(0xFF283618),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text('Login',
                    style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: 20)),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReemKufi_Green(textValue: "Don't have an account?  ", size: displayHeight(context)* 0.0225),
                    Flexible(
                        child: InkWell(
                          child: ReemKufi_Green_Bold(textValue: "Register",size: displayHeight(context)* 0.025),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => registerAndQuiz()));
                          },
                        )
                    ),
                  ]
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Padding(
                padding: EdgeInsets.only(
                    left: displayHeight(context) * 0.03,
                    right: displayHeight(context) * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blackLine(),
                    SizedBox(width: displayWidth(context) * 0.01),
                    ReemKufi_Green_Bold(textValue: ' or continue with ', size: displayHeight(context) * 0.03),
                    SizedBox(width: displayWidth(context) * 0.01),
                    blackLine(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: displayHeight(context) * 0.05,
                    right: displayHeight(context) * 0.05),
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Padding(
                padding: EdgeInsets.only(
                    left: displayHeight(context) * 0.05,
                    right: displayHeight(context) * 0.05),
                child: SignInButton(
                  Buttons.Facebook,
                  text: "Sign up with Facebook",
                  onPressed: () {},
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Flexible(
              //       child: InkWell(
              //         child: ReemKufi_Green_Bold(textValue: "Forgot Password?",size: displayHeight(context)* 0.0275),
              //         onTap: (){
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => ForgotPassword()));
              //         },
              //       )
              //     ),
              //     SizedBox(width: displayWidth(context) * 0.03),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "New Password"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'New Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),

              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Confirm Password',
                  hintText: 'Re-Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context, // user must tap button!
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: const Color(0xff283618),
                        title: Column(
                          children: [
                            ReemKufiOffwhite(textValue: 'Your Password has been reset', size: displayHeight(context) * 0.04),
                            Icon(Icons.check_circle_outline_outlined, color: Colors.white, size: displayHeight(context) * 0.08,)
                          ],
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffFFFDF4)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Text('OK',
                                        style: GoogleFonts.reemKufi(
                                            color: Colors.black,
                                            fontSize:
                                            displayHeight(context) *
                                                0.03)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => LogInScreen()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: displayWidth(context) * 0.7),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  primary: Color(0xFF283618),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text('Change Password',
                    style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                child: ReemKufi_Green_Bold(textValue: "Forgot your password? Don’t worry? \n Just enter your email to receive\n a link to reset your password.", size: displayHeight(context)*0.025)
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_sharp, color: Color(0xFF283618)),
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResetPassword()));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: displayWidth(context) * 0.7),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  primary: Color(0xFF283618),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text('Send',
                    style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewPassword()));
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: displayWidth(context) * 0.7),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  primary: Color(0xFF283618),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text('Reset Password',
                    style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: 20)),
              ),
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

