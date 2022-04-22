import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../log_in_sign_up_feature/log_in_screen.dart';
import '../main.dart';
import '../utilities/utility.dart';
import 'account_created.dart';


class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  _createAccountState createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: 'Create Account'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const field(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon:
                  Icon(Icons.person_outline, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon:
                  Icon(Icons.email_sharp, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                  prefixIcon:
                  Icon(Icons.smartphone_rounded, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon:
                  Icon(Icons.visibility_off, color: Color(0xFF283618))),
              SizedBox(height: displayHeight(context) * 0.05),
              GreenButton(
                buttonWidth: displayWidth(context) * 0.7,
                buttonHeight: displayHeight(context) * 0.08,
                textSize: displayHeight(context) * 0.03,
                buttonText: 'Create Account',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => accountCreated()));
                },
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: ReemKufi_Green_Bold(
                        textValue: 'Already have an account?',
                        size: displayHeight(context) * 0.025),
                  ),
                  SizedBox(width: displayWidth(context) * 0.03),
                  Flexible(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInScreen()));
                      },
                      child: Text('Login',
                          style: GoogleFonts.reemKufi(
                              color: Color(0xFF4D4D4D), fontSize: 20)),
                      //backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}