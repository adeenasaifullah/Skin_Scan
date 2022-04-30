import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/provider/google_sign_in.dart';
import 'package:skin_scan/register_feature/create_account.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../Models/users_model.dart';
import '../main.dart';
import '../register_feature/account_created.dart';
import '../utilities/utility.dart';
import 'log_in_screen.dart';
import 'package:skin_scan/services/auth.dart';

class LogInRegisterScreen extends StatefulWidget {
  const LogInRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LogInRegisterScreen> createState() => _LogInRegisterScreenState();
}

class _LogInRegisterScreenState extends State<LogInRegisterScreen> {
 final AuthService _auth = AuthService();
 String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: ''),
      body: SingleChildScrollView(
        child: Center(
          child: Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ImageIcon(
                        const AssetImage("assets/faces.png"),
                        color: const Color(0xff283618),
                        size: displayHeight(context) * 0.3,
                      ),
                    ),
                  ],
                ),
                ReemKufi_Green(
                    textValue: 'Skin Scan',
                    size: displayHeight(context) * 0.08),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) * 0.05),
                    child: Rambla_Grey_Center(
                        textValue:
                        'Efficient and safe decisions for your skin!',
                        size: displayHeight(context) * 0.025)),
                SizedBox(height: displayHeight(context) * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 2,
                      child: GreenButton(
                        buttonWidth: displayWidth(context) * 0.30,
                        buttonHeight: displayHeight(context) * 0.07,
                        textSize: displayHeight(context) * 0.03,
                        buttonText: 'Register',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => createAccount()));
                        },
                      ),
                    ),
                    SizedBox(width: displayWidth(context) * 0.1),
                    Flexible(
                      flex: 2,
                      child: LightGreenButton(
                        buttonWidth: displayWidth(context) * 0.30,
                        buttonHeight: displayHeight(context) * 0.07,
                        textSize: displayHeight(context) * 0.03,
                        buttonText: 'Login',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        },
                      ),
                    ),
                  ],
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
                      ReemKufi_Green(
                          textValue: ' or continue with ',
                          size: displayHeight(context) * 0.03),
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
                      text: "Sign in with Google",
                    onPressed: () async {
                      // Provider.of<GoogleSignInProvider>(context, listen: false).googleSignIn;
                      // print('im in method');
                      // print('im below method');
                      dynamic result = await _auth.signInWithGoogle(
                          );
                      if (result is AuthenticateUser) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => accountCreated()));
                      }
                      else {
                        setState(() => error = 'Please supply a valid email.');
                      }
                    },
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.02),
                // Padding(
                //   padding: EdgeInsets.only(
                //       left: displayHeight(context) * 0.05,
                //       right: displayHeight(context) * 0.05),
                //   child: SignInButton(
                //     Buttons.Facebook,
                //     text: "Sign up with Facebook",
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class blackLine extends StatelessWidget {
  const blackLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
          height: 3.0, width: displayWidth(context) * 0.1, color: Colors.black),
    );
  }
}
