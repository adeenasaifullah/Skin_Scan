import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              SizedBox(height: displayHeight(context) * 0.05),
              ElevatedButton(
                onPressed: () {},
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
                children: <Widget>[
                  Flexible(
                    child: InkWell(
                      child: TextValue(text: "Forgot Password?", textSize: 20,bold: true),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                      },
                    )
                  ),
                  SizedBox(width: displayWidth(context) * 0.03),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class field extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  const field(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  _fieldState createState() => _fieldState();
}

class _fieldState extends State<field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.8,
      child: TextFormField(
        decoration: InputDecoration(
            fillColor: Color(0xFFDADBC6),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(width: 6, style: BorderStyle.solid)),
            labelText: widget.labelText,
            labelStyle: GoogleFonts.reemKufi(
                color: Color(0xFF283618),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.rambla(
                color: Color(0xFF283618), fontStyle: FontStyle.italic),
            prefixIcon: widget.prefixIcon,
            //Icon(Icons.lock, color: Color(0xFF283618)),
            suffixIcon: widget.suffixIcon
            //Icon(Icons.visibility_off, color: Color(0xFF283618))),
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
                            Text('Your Password has been reset',
                                style: GoogleFonts.reemKufi(
                                    color: Color(0xffFFFDF4),
                                    fontSize: displayHeight(context) * 0.04)),
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
                                    Navigator.of(context).pop();
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
                child: TextValue(text: "Forgot your password? Don’t worry? \n Just enter your email to receive\n a link to reset your password.", textSize: 20, bold: true)
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
                  child: TextValue(text: "Hi, Afzal.", textSize: 38, bold: true)
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              Container(
                  child: TextValue(text: "We’ve got a request to reset your \naccount password.", textSize: 20, bold: true)
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
                  child: TextValue(text: "If you ignore this message, \nyour password will not be changed.", textSize: 20, bold: true)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

