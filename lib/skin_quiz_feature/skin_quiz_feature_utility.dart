import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/utility.dart';



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
              fontSize: displayHeight(context) * 0.025,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}