import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/services/auth.dart';
import '../log_in_sign_up_feature/log_in_screen.dart';
import '../main.dart';
import '../utilities/utility.dart';
import 'account_created.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skin_scan/services/auth.dart';

class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  _createAccountState createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String phone = "";
  String password = "";
  String confirmPassword = "";
  TextEditingController emailController = TextEditingController();
  //r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  final validators = MultiValidator([
    //EmailValidator(errorText: "Enter valid email id"),
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: 'Create Account'),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                field(
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon:
                      Icon(Icons.person_outline, color: Color(0xFF283618)),
                  validateInput: (name) {
                    if (name!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(name!)) {
                      //allow upper and lower case alphabets and space
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon:
                        Icon(Icons.email_sharp, color: Color(0xFF283618)),
                    //validateInput: (email) => EmailValidator(errorText: 'Please enter valid email!') ,
                    validateInput: (email) {
                      // if (email!.isEmpty) {
                      //   return "* Required";
                      // }
                      //EmailValidator(errorText: "Enter valid email id");
                      //PatternValidator(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      // errorText: 'passwords must have at least one special character');
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
                    }),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                    validateInput: (phone) {
                      if (phone!.isEmpty) {
                        return "* Required";
                      } else if (!RegExp(r'^[0-9]{11}$').hasMatch(phone!)) {
                        //  r'^[0-9]{10}$' pattern plain match number with length 11
                        return "Enter correct phone number";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() => phone = val);
                    },
                    labelText: 'Phone',
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.smartphone_rounded,
                        color: Color(0xFF283618))),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                    validateInput: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText:
                              "Password should be at least 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters")
                    ]),
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                    suffixIcon:
                        Icon(Icons.visibility_off, color: Color(0xFF283618))),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                    validateInput: (confirmPassword) {
                      if (confirmPassword!.isEmpty) return '* Required';
                      if (confirmPassword! != password!)
                        return 'The password does not match!';
                      return null;
                    },
                    onChanged: (val) {
                      setState(() => confirmPassword = val);
                    },
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
                  onPressed: () async {
                    bool isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => accountCreated()));
                    }
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
      ),
    );
  }
}
