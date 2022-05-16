import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class skinQuizProvider with ChangeNotifier {

  List<String> options = [];
  String skinType = "";


  List<String> getOptions() {
    return options;
  }

  String determineSkinType() {
    if (options.contains('Large and Visible') && options.contains('Bright like a diamond') && options.contains('Slick and greasy')) {
      skinType = "Oily";
    }
    else if (options.contains('Rough and scaly') && options.contains('Loads of moisturizer') && options.contains('Small/ Not noticeable')) {
      skinType = "Dry";
    }
    else if (options.contains('Visible only in T-zone') && options.contains('Shiny in my T-zone only') && options.contains('Blotting or powder on forehead/nose/chin')) {
      skinType = "Combination";
    }
    else {
      skinType = "Normal";
    }
    return skinType;
  }

}
