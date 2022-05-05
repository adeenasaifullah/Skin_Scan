import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Size displaySize(BuildContext context) {
  //debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  //debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  //debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

class ReemKufiOffwhite extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufiOffwhite(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

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
  const ReemKufiOffwhite_Italic(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
          color: const Color(0xFFFFFDF4),
          fontSize: size,
          fontStyle: FontStyle.italic),
    );
  }
}

class ReemKufi_Grey extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Grey({Key? key, required this.textValue, required this.size})
      : super(key: key);

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

// class ReemKufi_OffWhite extends StatelessWidget {
//   final String textValue;
//   final double size;
//   const ReemKufi_OffWhite({Key? key, required this.textValue, required this.size})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       textValue,
//       style: GoogleFonts.reemKufi(
//         color: const Color(0xFFFFFDF4),
//         fontSize: size,
//       ),
//     );
//   }
// }

class ReemKufi_OffWhite_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_OffWhite_Center(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.reemKufi(
        color: const Color(0xFFFFFDF4),
        fontSize: size,
      ),
    );
  }
}

class ReemKufi_Black extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Black({Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
        color: Colors.black,
        fontSize: size,
      ),
    );
  }
}

class ReemKufi_Grey_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Grey_Center(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

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
  const ReemKufi_Green({Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      //overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      softWrap: true,
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
  const ReemKufi_Green_Italic(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
          color: const Color(0xff283618),
          fontSize: size,
          fontStyle: FontStyle.italic),
    );
  }
}

class ReemKufi_Green_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green_Center(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

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
  const ReemKufi_Green_Bold(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.reemKufi(
          color: const Color(0xff283618),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}

class ReemKufi_Green_Bold_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green_Bold_Center(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.reemKufi(
          color: const Color(0xff283618),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}

class ReemKufi_Green_Bold_Left extends StatelessWidget {
  final String textValue;
  final double size;
  const ReemKufi_Green_Bold_Left(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.left,
      style: GoogleFonts.reemKufi(
          color: const Color(0xff283618),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}

class Raleway_Green_Bold_Left extends StatelessWidget {
  final String textValue;
  final double size;
  const Raleway_Green_Bold_Left(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.left,
      softWrap: true,
      style: GoogleFonts.raleway(
          color: const Color(0xff283618),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}

class Rambla_Grey_Center extends StatelessWidget {
  final String textValue;
  final double size;
  const Rambla_Grey_Center(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textAlign: TextAlign.center,
      style: GoogleFonts.rambla(
          color: const Color(0xff4D4D4D),
          fontSize: size,
          fontStyle: FontStyle.italic),
    );
  }
}

class Rambla_Green_Italic extends StatelessWidget {
  final String textValue;
  final double size;
  const Rambla_Green_Italic(
      {Key? key, required this.textValue, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.rambla(
          color: const Color(0xFF283618),
          fontSize: size,
          fontStyle: FontStyle.italic),
    );
  }
}

class field extends StatefulWidget {
  //final bool? obscuredText;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final IconData? suffixIcon;
  final bool autoFocus;
  final String? Function(String?)? validateInput;
  final TextEditingController textController;
  final VoidCallback? onPressed;

  const field({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    //required this.onChanged,
    this.validateInput,
    required this.autoFocus,
    this.onPressed,
    //this.obscuredText,
    //this.onPressed
  }) : super(key: key);

  @override
  _fieldState createState() => _fieldState();
}

class _fieldState extends State<field> {
  final _formKey = GlobalKey<FormState>();
  bool _obscured = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.8,
      child: TextFormField(
        obscureText: _obscured,
        controller: widget.textController,
        //onChanged: widget.onChanged,
        validator: widget.validateInput,
        decoration: InputDecoration(
          fillColor: Color(0xFFDADBC6),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(width: 6, style: BorderStyle.solid)),
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
          suffixIcon: IconButton(
              icon: Icon(widget.suffixIcon),
              onPressed: () {
                _obscured = !_obscured;
                setState(() {});
              }),
        ),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double textSize;
  final String buttonText;
  final VoidCallback? onPressed;
  const GreenButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.textSize,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 20,
        fixedSize: Size(buttonWidth, buttonHeight),
        primary: Color(0xFF283618),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onPressed,
      child: ReemKufiOffwhite(textValue: buttonText, size: textSize),
    );
  }
}

class LightGreenButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double textSize;
  final String buttonText;
  final VoidCallback onPressed;
  const LightGreenButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.textSize,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 20,
        fixedSize: Size(buttonWidth, buttonHeight),
        primary: Color(0xFFDADBC6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onPressed,
      child: ReemKufi_Green(textValue: buttonText, size: textSize),
    );
  }
}
