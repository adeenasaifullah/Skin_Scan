import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/password_reset_feature/forgot_password.dart';
import 'package:skin_scan/main.dart';
import 'package:skin_scan/services/auth.dart';
import '../models/users_adeena_model.dart';
import '../provider/product_provider.dart';
import '../provider/user_provider.dart';
import '../register_feature/account_created.dart';
import '../utilities/bottom_app_bar.dart';
import '../utilities/progressIndicator.dart';
import '../utilities/utility.dart';
import 'log_in_register_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool _isLoading = true;
  //bool obscureIcon = true;
  //text field state
  // String email = "";
  // String password = "";
  String error = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "Log In"),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                  // onChanged: (val) {
                  //   setState(() => email = val);
                  // },
                  textController: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_sharp, color: Color(0xFF283618)),
                  autoFocus: false,
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                  validateInput: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(6,
                        errorText: "Password should be at least 6 characters"),
                    MaxLengthValidator(15,
                        errorText:
                            "Password should not be greater than 15 characters")
                  ]),
                  // onChanged: (val) {
                  //   setState(() => password = val);
                  // },
                  textController: passwordController,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon: Icons.visibility_off,
                  //suffixIcon:  obscureIcon ? Icons.visibility : Icons.visibility_off,
                  autoFocus: false,
                ),
                SizedBox(height: displayHeight(context) * 0.025),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.55,
                    ),
                    InkWell(
                      child: ReemKufi_Green_Bold(
                          textValue: "Forgot Password?",
                          size: displayHeight(context) * 0.0275),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: displayHeight(context) * 0.025),
                GreenButton(
                    buttonText: 'Login',
                    textSize: displayHeight(context) * 0.03,
                    buttonHeight: displayHeight(context) * 0.08,
                    buttonWidth: displayWidth(context) * 0.7,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            emailController.text.trim(),
                            passwordController.text.trim());
                        if (result is AuthenticateUser) {
                          //await context.read<UserProvider>().getUserFavouriteProducts(context.read<ProductProvider>().productsList);
                          await context.read<UserProvider>().getCurrentUserFromDb();
                          await context.read<UserProvider>().getUserFavouriteProducts(context.read<ProductProvider>().productsList);

                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => MyBottomAppBar()));
                        } else {
                          setState(() =>
                              error = 'You have entered wrong credentials.');
                        }
                      }
                    }

                    ),
                SizedBox(height: displayHeight(context) * 0.02),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ReemKufi_Green(
                      textValue: "Don't have an account?  ",
                      size: displayHeight(context) * 0.0225),
                  InkWell(
                    child: ReemKufi_Green_Bold(
                        textValue: "Register",
                        size: displayHeight(context) * 0.025),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LogInRegisterScreen()));
                    },
                  ),
                ]),
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
                      ReemKufi_Green_Bold(
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
                    text: "Sign up with Google",
                    onPressed: () async {
                      if (_isLoading == true) {
                        buildShowDialog(context);
                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      }
                      dynamic result = await _auth.signInWithGoogle();
                      if (result is AuthenticateUser) {
                        if (FirebaseAuth.instance.currentUser == null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => accountCreated()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBottomAppBar()));
                        }
                      } else {
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
