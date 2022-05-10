
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/main.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../provider/ingredient_provider.dart';
import '../utilities/bottom_app_bar.dart';
import 'ingredient_list.dart';
import 'ocr_text_detail.dart';

class OcrScan extends StatefulWidget {
  const OcrScan({Key? key}) : super(key: key);

  @override
  _OcrScanState createState() => _OcrScanState();
}

class _OcrScanState extends State<OcrScan> {

  int? _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool _autoFocusOcr = true;
  bool _torchOcr = false;
  bool _multipleOcr = true;
  bool _waitTapOcr = true;
  bool _showTextOcr = true;
  // bool _commaSeparated = false;
  // bool _lineSeparated = false;
  Size? _previewOcr;
  List<OcrText> _textsOcr = [];

  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
      //_previewBarcode = previewSizes[_cameraBarcode].first;
      _previewOcr = previewSizes[_cameraOcr]!.first;
      //_previewFace = previewSizes[_cameraFace].first;
    }));
  }


  Future<Null> _read() async {
    List<OcrText> texts = [];
    Size _scanpreviewOcr = _previewOcr ?? FlutterMobileVision.PREVIEW;
    try {
      texts = await FlutterMobileVision.read(
        flash: _torchOcr,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        waitTap: _waitTapOcr,
        //OPTIONAL: close camera after tap, even if there are no detection.
        //Camera would usually stay on, until there is a valid detection
        forceCloseCameraOnTap: true,
        //OPTIONAL: path to save image to. leave empty if you do not want to save the image
        imagePath: '', //'path/to/file.jpg'
        showText: _showTextOcr,
        preview: _previewOcr ?? FlutterMobileVision.PREVIEW,
        scanArea: Size(_scanpreviewOcr.width - 20, _scanpreviewOcr.height - 20),
        camera: _cameraOcr ?? FlutterMobileVision.CAMERA_BACK,
        fps: 2.0,
      );
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }

    if (!mounted) return;

    setState(() => _textsOcr = texts);
  }

  List<DropdownMenuItem<int>> _getCameras() {
    List<DropdownMenuItem<int>> cameraItems = [];

    cameraItems.add(DropdownMenuItem(
      child: ReemKufi_Grey(textValue: 'BACK', size: displayHeight(context)*0.02,),
      value: FlutterMobileVision.CAMERA_BACK,
    ));

    cameraItems.add(DropdownMenuItem(
      child: ReemKufi_Grey(textValue: 'FRONT', size: displayHeight(context)*0.02,),
      value: FlutterMobileVision.CAMERA_FRONT,
    ));

    return cameraItems;
  }

  List<DropdownMenuItem<Size>> _getPreviewSizes(int facing) {
    List<DropdownMenuItem<Size>> previewItems = [];

    List<Size>? sizes = FlutterMobileVision.getPreviewSizes(facing);

    if (sizes != null) {
      sizes.forEach((size) {
        previewItems.add(
          DropdownMenuItem(
            child: ReemKufi_Grey(textValue: size.toString(), size: displayHeight(context)*0.025,),
            value: size,
          ),
        );
      });
    } else {
      previewItems.add(
        DropdownMenuItem(
          child: Text('Empty'),
          value: null,
        ),
      );
    }

    return previewItems;
  }

  Widget _getOcrScreen(BuildContext context) {
    List<Widget> items = [];

    items.add(Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 18.0,
        right: 18.0,
      ),
      child: ReemKufi_Grey(textValue: 'Camera:', size: displayHeight(context)*0.025,),
    ));

    items.add(Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
      ),
      child: DropdownButton<int>(
        items: _getCameras(),
        onChanged: (value) {
          _previewOcr = null;
          setState(() => _cameraOcr = value);
        },
        value: _cameraOcr,
      ),
    ));

    items.add(Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 18.0,
        right: 18.0,
      ),
      child: ReemKufi_Grey(textValue: 'Preview Size:', size: displayHeight(context)*0.025,)
    ));

    items.add(Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
      ),
      child: DropdownButton<Size>(
        items: _getPreviewSizes(_cameraOcr ?? 0),
        onChanged: (value) {
          setState(() => _previewOcr = value);
        },
        value: _previewOcr,
      ),
    ));

    items.add(SwitchListTile(
      title: ReemKufi_Grey(textValue: 'Auto Focus:', size: displayHeight(context)*0.025,),
      tileColor: Color(0xffFFFDF4),
      activeTrackColor: Color(0xffBBBD88),
      activeColor: Color(0xFF283618),
      inactiveThumbColor: Color(0xFFFFFDF4),
      value: _autoFocusOcr,
      onChanged: (value) => setState(() => _autoFocusOcr = value),
    ));

    items.add(SwitchListTile(
      title: ReemKufi_Grey(textValue: 'Torch:', size: displayHeight(context)*0.025,),
      tileColor: Color(0xffFFFDF4),
      activeTrackColor: Color(0xffBBBD88),
      activeColor: Color(0xFF283618),
      inactiveThumbColor: Color(0xFFFFFDF4),
      value: _torchOcr,
      onChanged: (value) => setState(() => _torchOcr = value),
    ));

    // items.add(SwitchListTile(
    //   title: ReemKufi_Grey(textValue: 'Return all texts:', size: displayHeight(context)*0.025,),
    //   tileColor: Color(0xffFFFDF4),
    //   activeTrackColor: Color(0xffBBBD88),
    //   activeColor: Color(0xFF283618),
    //   inactiveThumbColor: Color(0xFFFFFDF4),
    //   value: _multipleOcr,
    //   onChanged: (value) => setState(() => _multipleOcr = value),
    // ));

    // items.add(SwitchListTile(
    //   title: ReemKufi_Grey(textValue: 'Comma Separated Ingredients:', size: displayHeight(context)*0.025,),
    //   tileColor: Color(0xffFFFDF4),
    //   activeTrackColor: Color(0xffBBBD88),
    //   activeColor: Color(0xFF283618),
    //   inactiveThumbColor: Color(0xFFFFFDF4),
    //   value: _commaSeparated,
    //   onChanged: (value) => setState(() => _commaSeparated = value),
    // ));

    // items.add(SwitchListTile(
    //   title: ReemKufi_Grey(textValue: 'Line Separated Ingredients:', size: displayHeight(context)*0.025,),
    //   tileColor: Color(0xffFFFDF4),
    //   activeTrackColor: Color(0xffBBBD88),
    //   activeColor: Color(0xFF283618),
    //   inactiveThumbColor: Color(0xFFFFFDF4),
    //   value: _lineSeparated,
    //   onChanged: (value) => setState(() => _lineSeparated = value),
    // ));

    items.add(SwitchListTile(
      title: ReemKufi_Grey(textValue: 'Capture on Tap:', size: displayHeight(context)*0.025,),
      tileColor: Color(0xffFFFDF4),
      activeTrackColor: Color(0xffBBBD88),
      activeColor: Color(0xFF283618),
      inactiveThumbColor: Color(0xFFFFFDF4),
      value: _waitTapOcr,
      onChanged: (value) => setState(() => _waitTapOcr = value),
    ));

    items.add(SwitchListTile(
      title: ReemKufi_Grey(textValue: 'Show text:', size: displayHeight(context)*0.025,),
      tileColor: Color(0xffFFFDF4),
      activeTrackColor: Color(0xffBBBD88),
      activeColor: Color(0xFF283618),
      inactiveThumbColor: Color(0xFFFFFDF4),
      value: _showTextOcr,
      onChanged: (value) => setState(() => _showTextOcr = value),
    ));

    items.add(
      Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
          left: 18.0,
          right: 18.0,
          bottom: 12.0,
        ),
        child: GreenButton(buttonText: 'Scan', buttonWidth: displayWidth(context) * 0.01,
            buttonHeight: displayHeight(context) * 0.07,  textSize: displayHeight(context) * 0.03,
            onPressed: _read,
        ),
      ),
    );

    items.addAll(
      ListTile.divideTiles(
        context: context,
        tiles: _textsOcr
            .map(
              (ocrText) => OcrTextWidget(ocrText),
        )
            .toList(),
      ),
    );

    return ListView(
      padding: const EdgeInsets.only(
        top: 12.0,
      ),
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFFDF4),
        centerTitle: false,
        title: ReemKufi_Grey(
            textValue: 'Scan Ingredient', size: displayWidth(context) * 0.05),
        iconTheme: const IconThemeData(
          color: const Color(0xFF4D4D4D), //change your color here
        ),
        leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Color(0xFF4D4D4D)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyBottomAppBar(),
                ),
                    (route) => false,
              );
            }),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: displayWidth(context) * 0.05,
                top: displayHeight(context) * 0.005),
            child: Image(
                image: AssetImage('assets/dots for app dev.png'),
                fit: BoxFit.fill,
                height: displayHeight(context) * 1,
                width: displayWidth(context) * 0.1),
          ),
        ],
      ),
      body: _getOcrScreen(context),
    );
  }
}



class OcrTextWidget extends StatelessWidget {
  final OcrText ocrText;
  List<String> ingredientName = [];
  List<Ingredient> ingredientList = [];

  OcrTextWidget(this.ocrText);
  final _formKey = GlobalKey<FormState>();
  late TextEditingController productName_controller= TextEditingController();

  CommaSeparateIngredients(String ocrText){
    List ing = ocrText.split(',');
    List second = ocrText.split(' ');
    ing.addAll(second);
    for(String value in ing){
      value = value.replaceAll(',', "");
      ingredientName.add(value.trim());
      print(value);
    }
  }

  // Future ExtractIngredientInfo(context, List<String> ingredientName) async {
  //   Provider.of<IngredientProvider>(context,listen: false).ingredientList.clear();
  //   for(String name in ingredientName){
  //     await Provider.of<IngredientProvider>(context,listen: false).getIngredientInfo(name);
  //   }
  //   ingredientList = await Provider.of<IngredientProvider>(context,listen: false).ingredientList;
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.title),
      title: Text(ocrText.value),
      subtitle: Text(ocrText.language),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async{
         CommaSeparateIngredients(ocrText.value);
        // //ExtractIngredientInfo(context, ingredientName);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IngredientsList(ingredientName: ingredientName),
          ),
        );
        // return showDialog(
        //     barrierDismissible: false,
        //     context: context, // user must tap button!
        //     builder: (context) {
        //       return  Form(
        //         key: _formKey,
        //         child: AlertDialog(
        //           backgroundColor: const Color(0xff283618),
        //           title: ReemKufiOffwhite(textValue: 'Enter product name',
        //             size: displayHeight(context) * 0.04,),
        //           content: TextFormField(
        //             controller: productName_controller,
        //             validator:  (productName){
        //               if (productName_controller.text.isEmpty) {
        //                 print("validated");
        //                 return "* Required";
        //               }
        //               else {
        //                 return null;
        //               }
        //             },
        //
        //             autofocus: false,
        //             decoration: InputDecoration(
        //               hintText: 'Enter product name',
        //               hintStyle: GoogleFonts.reemKufi(
        //                   color: Color(0xffFFFDF4),
        //                   fontSize: displayHeight(context) * 0.03),
        //             ),
        //             style: GoogleFonts.reemKufi(
        //                 color: Color(0xffFFFDF4),
        //                 fontSize: displayHeight(context) * 0.03),
        //           ),
        //           actions: <Widget>[
        //             Padding(
        //               padding:
        //               EdgeInsets.all(displayHeight(context) * 0.03),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   TextButton(
        //                     style: TextButton.styleFrom(
        //                         backgroundColor: Color(0xffBBBD88)),
        //                     child: ReemKufi_Black(textValue: 'Continue',
        //                       size: displayHeight(context) * 0.03,),
        //                     onPressed: () async {
        //                       if (_formKey.currentState!.validate()) {
        //                         //CommaSeparateIngredients(ocrText.value);
        //                         Navigator.of(context).push(
        //                           MaterialPageRoute(
        //                             builder: (context) => IngredientsList(ingredientName: ingredientName),
        //                           ),
        //                         );
        //                       }
        //
        //                     },
        //                   ),
        //                   TextButton(
        //                     style: TextButton.styleFrom(
        //                         backgroundColor: Color(0xffBBBD88)),
        //                     child: ReemKufi_Black(textValue: 'Cancel',
        //                       size: displayHeight(context) * 0.03,),
        //                     onPressed: () {
        //                       Navigator.pushAndRemoveUntil(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (BuildContext context) =>
        //                               OcrScan(),
        //                         ),
        //                             (route) => false,
        //                       );
        //                     },
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        // );

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => OcrTextDetail(ocrText),
        //   ),
        // );
      }

      // onTap: () => Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => OcrTextDetail(ocrText),
      //   ),
      // ),
    );
  }
}
