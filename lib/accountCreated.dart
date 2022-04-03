import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screenSizes.dart';
import 'main.dart';

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
      appBar: const AppBarDetails(screenName: ''),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome!',
                        style: GoogleFonts.reemKufi(
                            color: const Color(0XFF4D4D4D),
                            fontSize: displayHeight(context) * 0.1)),
                    SizedBox(width: displayWidth(context)*0.02),
                    ImageIcon(
                      const AssetImage("assets/dots.png"),
                      color: const Color(0xffBFC2A4),
                      size: displayHeight(context)*0.12,
                    ),
                  ],
                ),

                SizedBox(height: displayHeight(context) * 0.05),

                Text('Congrats!',
                    style: GoogleFonts.reemKufi(
                        color: const Color(0XFF283618),
                        fontSize: displayHeight(context) * 0.06)),

                Text('Your account has been created.',
                    style: GoogleFonts.reemKufi(
                        color: const Color(0XFF283618),
                        fontSize: displayHeight(context) * 0.06)),

                SizedBox(height: displayHeight(context) * 0.05),

                Text('Continue to take a quiz to identify your skin type.',
                    style: GoogleFonts.rambla(
                        color: const Color(0XFF4D4D4D),
                        fontStyle: FontStyle.italic,
                        fontSize: displayHeight(context) * 0.04)),

                SizedBox(height: displayHeight(context) * 0.05),

                SizedBox(height: displayHeight(context) * 0.05),

                ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => skinTypeQuiz()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(displayWidth(context) * 0.18,
                          displayHeight(context) * 0.08),
                      primary: const Color(0xFF283618),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text('Continue', style: GoogleFonts.reemKufi(
                        color: Colors.white, fontSize: displayHeight(context)*0.03)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
