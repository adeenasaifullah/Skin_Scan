import 'package:flutter/material.dart';
import 'package:skin_scan/utilities/utility.dart';

buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            color: const Color(0xFF4D4D4D),
            backgroundColor: const Color(0xff283618),
            strokeWidth: displayWidth(context) * 0.02,
          ),
        );
      });
}
