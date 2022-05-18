import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/services/auth.dart';
import '../models/users_model.dart';
import '../log_in_sign_up_feature/log_in_screen.dart';
import '../main.dart';
import '../provider/categories_provider.dart';
import '../provider/product_provider.dart';
import '../provider/user_provider.dart';
import '../utilities/utility.dart';
import 'account_created.dart';

class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  _createAccountState createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final validators = MultiValidator([
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
                  textController: nameController,
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon:
                      Icon(Icons.person_outline, color: Color(0xFF283618)),
                  validateInput: (name) {
                    if (nameController.text.isEmpty) {
                      return "* Required";
                    }
                    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(name!)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                  autoFocus: false,
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                  textController: emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_sharp, color: Color(0xFF283618)),
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
                  autoFocus: false,
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                  validateInput: (phone) {
                    if (phone!.isEmpty) {
                      return "* Required";
                    } else if (!RegExp(r'^[0-9]{11}$').hasMatch(phone)) {
                      return "Enter correct phone number";
                    } else {
                      return null;
                    }
                  },
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                  prefixIcon:
                      Icon(Icons.smartphone_rounded, color: Color(0xFF283618)),
                  textController: phoneController,
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
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon: Icons.visibility_off,
                  textController: passwordController,
                  autoFocus: false,
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                field(
                  textController: confirmPasswordController,
                  autoFocus: false,
                  validateInput: (confirmPassword) {
                    if (confirmPasswordController.text.isEmpty)
                      return '* Required';
                    if (confirmPasswordController.text !=
                        passwordController.text)
                      return 'The password does not match!';
                    return null;
                  },
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF283618)),
                  suffixIcon: Icons.visibility_off,
                  // onPressed: ,
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                GreenButton(
                  buttonWidth: displayWidth(context) * 0.7,
                  buttonHeight: displayHeight(context) * 0.08,
                  textSize: displayHeight(context) * 0.03,
                  buttonText: 'Create Account',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                      dynamic result = await _auth.registerWithEmailAndPassword(
                          emailController.text.trim(),
                          passwordController.text.trim());

                      if (result is AuthenticateUser) {
                        await context.read<CategoryProvider>().getCategoriesFromDb();
                        await context.read<ProductProvider>().getProductsFromDatabase();
                        Provider.of<UserProvider>(context, listen: false)
                            .getCurrentUserFromDb();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => accountCreated()));
                      } else {
                        setState(() => error = 'Please supply a valid email.');
                      }
                    }
                  },
                ),
                SizedBox(height: displayHeight(context) * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ReemKufi_Green_Bold(
                        textValue: 'Already have an account?',
                        size: displayHeight(context) * 0.025),
                    SizedBox(width: displayWidth(context) * 0.03),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInScreen()));
                      },
                      child: ReemKufi_OffWhite_Center(
                          textValue: 'Login',
                          size: displayHeight(context) * 0.03),
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
