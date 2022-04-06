import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_scan/LogIn.dart';
import 'HomePage.dart';
import 'main.dart';
import 'screenSizes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editProfile.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class registerAndQuiz extends StatefulWidget {
  const registerAndQuiz({Key? key}) : super(key: key);

  @override
  State<registerAndQuiz> createState() => _registerAndQuizState();
}

class _registerAndQuizState extends State<registerAndQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: ''),
      body: Center(
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
              Text(
                'Skin Scan',
                style: GoogleFonts.reemKufi(
                    color: Color(0xff283618),
                    fontSize: displayHeight(context) * 0.08),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.05),
                child: Text('Efficient and safe decisions for your skin!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rambla(
                        fontStyle: FontStyle.italic,
                        color: Color(0xff4D4D4D),
                        fontSize: displayHeight(context) * 0.03)),
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => createAccount()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        fixedSize: Size(displayWidth(context) * 0.30,
                            displayHeight(context) * 0.07),
                        primary: Color(0xFF283618),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text('Register',
                          style: GoogleFonts.reemKufi(
                              color: Colors.white,
                              fontSize: displayHeight(context) * 0.03)),
                    ),
                  ),
                  SizedBox(width: displayWidth(context) * 0.1),
                  Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        side: BorderSide(
                          width: 1.5,
                          color: Colors.black,
                        ),
                        fixedSize: Size(displayWidth(context) * 0.30,
                            displayHeight(context) * 0.07),
                        primary: Color(0xFFDADBC6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text('Login',
                          style: GoogleFonts.reemKufi(
                              color: Colors.black,
                              fontSize: displayHeight(context) * 0.03)),
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
                    Text(' Or continue with ',
                        style: GoogleFonts.rambla(
                            fontSize: displayHeight(context) * 0.03,
                            color: Colors.black)),
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
            ],
          ),
        ),
      ),
    );
  }
}

// class AppBarDetails extends StatefulWidget implements PreferredSizeWidget {
//   final String screenName;
//   const AppBarDetails({Key? key, required this.screenName}) : super(key: key);
//
//   @override
//   _AppBarDetailsState createState() => _AppBarDetailsState();
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(90);
// }
//
// class _AppBarDetailsState extends State<AppBarDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: AppBar(
//       elevation: 0,
//       backgroundColor: const Color(0xFFFFFDF4),
//       centerTitle: true,
//       title: Text(widget.screenName,
//           style: GoogleFonts.reemKufi(color: Color(0xFF4D4D4D), fontSize: 30)),
//       iconTheme: const IconThemeData(
//         color: const Color(0xFF4D4D4D), //change your color here
//       ),
//     ));
//   }
// }

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

//REGISTER / CREATE ACCOUNT SCREEN
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => accountCreated()));
                },
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
                        color: Colors.white,
                        fontSize: displayHeight(context) * 0.03)),
              ),
              SizedBox(height: displayHeight(context) * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Text('Already have an account?',
                        style: GoogleFonts.reemKufi(
                            color: Color(0xFF283618),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: displayWidth(context) * 0.03),
                  Flexible(
                    flex: 2,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => accountCreated()));
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

//ACCOUNT CREATED SCREEN
class accountCreated extends StatefulWidget {
  const accountCreated({Key? key}) : super(key: key);

  @override
  _accountCreatedState createState() => _accountCreatedState();
}

class _accountCreatedState extends State<accountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      //appBar: const AppBarDetails(screenName: ''),

      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.05),
          child: Padding(
            padding: EdgeInsets.all(displayHeight(context) * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: displayHeight(context) * 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text('Welcome!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.reemKufi(
                              color: const Color(0XFF4D4D4D),
                              fontSize: displayHeight(context) * 0.06)),
                    ),
                    SizedBox(width: displayWidth(context) * 0.02),
                    ImageIcon(
                      const AssetImage("assets/dots.png"),
                      color: const Color(0xffBFC2A4),
                      size: displayHeight(context) * 0.07,
                    ),
                  ],
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                Text('Congrats!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.reemKufi(
                        color: const Color(0XFF283618),
                        fontSize: displayHeight(context) * 0.04)),
                SizedBox(height: displayHeight(context) * 0.05),
                Text('Your account has been created.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.reemKufi(
                        color: const Color(0XFF283618),
                        fontSize: displayHeight(context) * 0.04)),
                SizedBox(height: displayHeight(context) * 0.1),
                Text('Continue to take a quiz to identify your skin type.',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.rambla(
                        color: const Color(0XFF4D4D4D),
                        fontStyle: FontStyle.italic,
                        fontSize: displayHeight(context) * 0.03)),
                SizedBox(height: displayHeight(context) * 0.15),
                //SizedBox(height: displayHeight(context) * 0.02),
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => skinTypeQuiz()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(displayWidth(context) * 0.40,
                          displayHeight(context) * 0.09),
                      primary: const Color(0xFF283618),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text('Continue',
                        style: GoogleFonts.reemKufi(
                            color: Colors.white,
                            fontSize: displayHeight(context) * 0.03)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//SKIN TYPE A QUIZ SCREEN
class skinTypeQuiz extends StatefulWidget {
  const skinTypeQuiz({Key? key}) : super(key: key);

  @override
  _skinTypeQuizState createState() => _skinTypeQuizState();
}

class _skinTypeQuizState extends State<skinTypeQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: const AppBarDetails(screenName: 'Skin Type Quiz'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: displayWidth(context)*0.03, right:displayWidth(context)*0.03 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  questions(
                      qnumber: 'Question 1',
                      question: 'Which age range do you fall into?',
                      description:
                          'Depending on your age, you may have specific concerns \n that might be relevant'),

                ],
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.2,
                    right: displayWidth(context) * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const selectAge(ageBracket: '<=17'),
                    SizedBox(width: displayWidth(context) * 0.1),
                    const selectAge(ageBracket: '18-24'),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.2,
                    right: displayWidth(context) * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const selectAge(ageBracket: '25-34'),
                    SizedBox(width: displayWidth(context) * 0.1),
                    const selectAge(ageBracket: '35-44'),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.07),
              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.2,
                    right: displayWidth(context) * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const selectAge(ageBracket: '45-54'),
                    SizedBox(width: displayWidth(context) * 0.1),
                    const selectAge(ageBracket: '55+'),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.03),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     nextButton(nextScreen: skinTypeQuizb()),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class selectAge extends StatelessWidget {
  final String ageBracket;

  const selectAge({
    Key? key,
    required this.ageBracket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => skinTypeQuizb()));
      },
      style: ElevatedButton.styleFrom(
        fixedSize:
            Size(displayWidth(context) * 0.20, displayHeight(context) * 0.10),
        elevation: 50,
        shadowColor: Colors.black,
        primary: const Color(0xFFDADBC6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        ageBracket,
        style: GoogleFonts.reemKufi(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}

class customAppBar extends StatelessWidget {
  const customAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFFFFDF4),
      centerTitle: true,
      title: Text('Skin Type Quiz',
          style: GoogleFonts.reemKufi(
              color: const Color(0xFF4D4D4D),
              fontSize: displayHeight(context) * 0.06)),
      iconTheme: const IconThemeData(
        color: Color(0xFF4D4D4D), //change your color here
      ),
    );
  }
}

class questions extends StatelessWidget {
  final String qnumber;
  final String question;
  final String description;

  const questions(
      {Key? key,
      required this.qnumber,
      required this.question,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(

          qnumber,
          textAlign: TextAlign.left,
          style: GoogleFonts.reemKufi(
              color: const Color(0xFF4D4D4D),
              fontSize: displayHeight(context) * 0.05,
              fontWeight: FontWeight.bold),
        ),
        Text(question,
            style: GoogleFonts.reemKufi(
                color: const Color(0xFF4D4D4D),
                fontSize: displayHeight(context) * 0.03,
                fontWeight: FontWeight.bold)),
        Text(
          description,
          softWrap: true,
          textAlign: TextAlign.center,
          style: GoogleFonts.reemKufi(
              color: const Color(0xFF4D4D4D),
              fontSize: displayHeight(context) * 0.02,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class nextButton extends StatelessWidget {
  final Widget nextScreen;

  const nextButton({Key? key, required this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => nextScreen));
        },
        style: ElevatedButton.styleFrom(
          fixedSize:
              Size(displayWidth(context) * 0.18, displayHeight(context) * 0.08),
          primary: const Color(0xFF283618),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text('Next',
            style: GoogleFonts.reemKufi(
                color: Colors.white, fontSize: displayHeight(context) * 0.03)));
  }
}

//SKIN TYPE B QUIZ SCREEN
class skinTypeQuizb extends StatefulWidget {
  const skinTypeQuizb({Key? key}) : super(key: key);

  @override
  _skinTypeQuizbState createState() => _skinTypeQuizbState();
}

class _skinTypeQuizbState extends State<skinTypeQuizb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: const AppBarDetails(screenName: 'Skin Type Quiz'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const questions(
                    qnumber: 'Question 2',
                    question: 'Where do you call home?',
                    description:
                        'Different climates and environments call for \n different approaches to skincare.'),

              ],
            ),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Sunny and Humid Place'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Dry and Hot Desert'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Cold and Dry'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Cold Winters, Dry Summers'),
            SizedBox(height: displayHeight(context) * 0.03),
            const place(typeOfPlace: 'Rainy and Moist Weather'),
            SizedBox(height: displayHeight(context) * 0.03),
          ],
        ),
      ),
    );
  }
}

class place extends StatelessWidget {
  final String typeOfPlace;

  const place({
    Key? key,
    required this.typeOfPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => skinTypeQuizc()));
      },
      style: ElevatedButton.styleFrom(
        fixedSize:
            Size(displayWidth(context) * 0.50, displayHeight(context) * 0.09),
        elevation: 10,
        shadowColor: Colors.black,
        primary: const Color(0xFFDADBC6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        typeOfPlace,
        textAlign: TextAlign.center,
        style: GoogleFonts.reemKufi(
          fontSize: displayHeight(context) * 0.025,
          color: Colors.black,
        ),
      ),
    );
  }
}

//SKIN TYPE C QUIZ SCREEN
class skinTypeQuizc extends StatefulWidget {
  const skinTypeQuizc({Key? key}) : super(key: key);

  @override
  _skinTypeQuizcState createState() => _skinTypeQuizcState();
}

class _skinTypeQuizcState extends State<skinTypeQuizc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: 'Skin Type Quiz'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const questions(
                    qnumber: 'Question 3',
                    question:
                        'On a scale of 1 - 5, how reactive \n would you consider your skin?',
                    description: ''),

              ],
            ),
            SizedBox(height: displayHeight(context) * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const rating(rate: '1'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '2'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '3'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '4'),
                SizedBox(width: displayWidth(context) * 0.015),
                const rating(rate: '5'),

                //SizedBox(height: displayHeight(context) * 0.05),
              ],
            ),
            SizedBox(height: displayHeight(context) * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: displayWidth(context) * 0.1),
                howReactiveText(text: '1- Very low reactive skin'),
                SizedBox(width: displayWidth(context) * 0.08),
                howReactiveText(text: '3- Moderately reactive skin'),
                SizedBox(width: displayWidth(context) * 0.18),
                howReactiveText(text: '5- Very reactive skin'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class rating extends StatelessWidget {
  final String rate;

  const rating({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize:
              Size(displayWidth(context) * 0.10, displayHeight(context) * 0.10),
          elevation: 20,
          shadowColor: Colors.black,
          primary: const Color(0xFFDADBC6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          rate,
          style: GoogleFonts.reemKufi(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        onPressed: () async {
          return showDialog(
              barrierDismissible: false,
              context: context, // user must tap button!
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color(0xff283618),
                  title: Text(
                      'Thank you for submitting the quiz! \n'
                      'Your skin type is: Oily',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.reemKufi(
                          color: const Color(0xffFFFDF4),
                          fontSize: displayHeight(context) * 0.04)),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(displayHeight(context) * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(onPressed: () {},
                          //     icon: Icon(CupertinoIcons.clear_circled, color: Colors.white)),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xffBBBD88)),
                            child: Text('OK',
                                style: GoogleFonts.reemKufi(
                                    color: Colors.black,
                                    fontSize: displayHeight(context) * 0.03)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePageScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        });
  }
}

class howReactiveText extends StatelessWidget {
  final String text;
  const howReactiveText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(text,
          textAlign: TextAlign.start,
          softWrap: true,
          style: GoogleFonts.rambla(
              fontSize: displayHeight(context) * 0.02,
              color: Colors.black,
              fontStyle: FontStyle.italic)),
    );
  }
}
