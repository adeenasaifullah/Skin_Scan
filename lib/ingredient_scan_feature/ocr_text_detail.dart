import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:skin_scan/main.dart';

class OcrTextDetail extends StatefulWidget {
  final OcrText ocrText;
  OcrTextDetail(this.ocrText);

  @override
  _OcrTextDetailState createState() => _OcrTextDetailState();
}


class _OcrTextDetailState extends State<OcrTextDetail> {

  void initState() {
    super.initState();
    CommaSeparateIngredients(widget.ocrText.value);
  }

  CommaSeparateIngredients(String ocrText){
     List ing = ocrText.split(',');
     print("here");
     for(String value in ing){
       print(value);
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "OCR Detail",),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(widget.ocrText.value),
            subtitle: const Text('Value'),
          ),
          ListTile(
            title: Text(widget.ocrText.language),
            subtitle: const Text('Language'),
          ),
          ListTile(
            title: Text(widget.ocrText.top.toString()),
            subtitle: const Text('Top'),
          ),
          ListTile(
            title: Text(widget.ocrText.bottom.toString()),
            subtitle: const Text('Bottom'),
          ),
          ListTile(
            title: Text(widget.ocrText.left.toString()),
            subtitle: const Text('Left'),
          ),
          ListTile(
            title: Text(widget.ocrText.right.toString()),
            subtitle: const Text('Right'),
          ),
        ],
      ),
    );
  }
}

