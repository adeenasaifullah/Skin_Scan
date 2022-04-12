import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';
import 'MyProfile.dart';
import 'scan.dart';
import 'package:skin_scan/viewRoutines.dart';

import 'ingredientDetails.dart';
import 'map_demo.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

class ReemKufiOffwhite extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufiOffwhite({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: const Color(0xFFFFFDF4),
        fontSize: size,
      ),
    );
  }
}

class ReemKufiOffwhite_Italic extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufiOffwhite_Italic({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: const Color(0xFFFFFDF4),
        fontSize: size,
        fontStyle: FontStyle.italic
      ),
    );
  }
}

class ReemKufi_Grey extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Grey({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: const Color(0xFF4D4D4D),
        fontSize: size,
      ),
    );
  }
}

class ReemKufi_Grey_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Grey_Center({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.reemKufi(
        color: const Color(0xFF4D4D4D),
        fontSize: size,
      ),
    );
  }
}

class ReemKufi_Green extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: const Color(0xff283618),
        fontSize: size,
      ),
    );
  }
}

class ReemKufi_Green_Italic extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green_Italic({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: const Color(0xff283618),
        fontSize: size,
        fontStyle: FontStyle.italic
      ),
    );
  }
}

class ReemKufi_Green_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green_Center({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.reemKufi(
        color: const Color(0xff283618),
        fontSize: size,
      ),
    );
  }
}

class ReemKufi_Green_Bold extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green_Bold({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: const Color(0xff283618),
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class Rambla_Grey_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const Rambla_Grey_Center({Key? key, required this.textValue, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.rambla(
        color: const Color(0xff4D4D4D),
        fontSize: size,
        fontStyle: FontStyle.italic
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