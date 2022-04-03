import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screenSizes.dart';
import 'accountCreated.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFFDF4),
        centerTitle: true,
        title: Text('Create Account',
            style:
                GoogleFonts.reemKufi(color: Color(0xFF4D4D4D), fontSize: 30)),
        iconTheme: IconThemeData(
          color: const Color(0xFF4D4D4D), //change your color here
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.05),
              const field(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon:
                  Icon(
                      Icons.person_outline,
                      color: Color(0xFF283618))),

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
                child: Text('Create Account',
                    style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: 20)),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text('Already have an account?',
                        style: GoogleFonts.reemKufi(
                            color: Color(0xFF283618),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: displayWidth(context) * 0.03),
                  Flexible(
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => accountCreated()));
                      },
                      child: Text('Login',
                          style: GoogleFonts.reemKufi(
                              color: Color(0xFF4D4D4D), fontSize: 20)),
                      backgroundColor: Colors.white,
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
