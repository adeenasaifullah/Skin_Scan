import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import 'package:skin_scan/utilities/bottom_app_bar.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../ingredient_search_feature/ingredient_details.dart';
import '../main.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  bool cameraInitialized = false;

  @override
  void initState() {
    super.initState();
    // Delay to allow the camera to initialize
    setState(() {});
    Future.delayed(Duration(seconds: 1), () {
      cameraInitialized = true;
      setState(() {});
    });
    // Camera[1] for Selfie Cam
    // Camera[0] for Main-Back Cam
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameras == null || !controller.value.isInitialized) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: displayHeight(context) * 2,
            width: displayWidth(context) * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReemKufi_Green(
                    textValue: 'Loading Camera',
                    size: displayHeight(context) * 0.04),
                const RefreshProgressIndicator(
                  backgroundColor: Color(0xff236318),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFFDF4),
        centerTitle: false,
        title: ReemKufi_Grey(
            textValue: 'Scan', size: displayWidth(context) * 0.05),
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
      // bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFFFDF4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              cameraInitialized
                  ? Column(
                children: [
                  Container(
                    height: displayHeight(context) * 0.7,
                    child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: CameraPreview(controller)),
                  ),
                  GreenButton(
                      buttonWidth: displayWidth(context) * 0.3,
                      buttonHeight: displayHeight(context) * 0.06,
                      textSize: displayHeight(context) * 0.03,
                      buttonText: 'Capture',
                      onPressed: () async {
                        return showDialog(
                          barrierDismissible: false,
                          context: context, // user must tap button!
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xff283618),
                              title: ReemKufiOffwhite(
                                  textValue:
                                  'Ingredient Scan Successful!',
                                  size: displayHeight(context) * 0.04),
                              actions: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                            Color(0xffBBBD88)),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: ReemKufi_Black(
                                              textValue: 'Continue',
                                              size:
                                              displayHeight(context) *
                                                  0.03),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    IngredientsList(),
                                              ));
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                            Color(0xffBBBD88)),
                                        child: ReemKufi_Black(
                                            textValue: 'Cancel',
                                            size: displayHeight(context) *
                                                0.03),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(false);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                ],
              )
                  : Padding(
                padding: EdgeInsets.symmetric(
                    vertical: displayHeight(context) * 0.3),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<CameraController>('controller', controller));
  }
}

class IngredientsList extends StatefulWidget {
  const IngredientsList({Key? key}) : super(key: key);

  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  // final List IngredientList = [
  //   "Aqua (Water)",
  //   "Paraffinum Liquid",
  //   "Hyaluronic Acid",
  //   "Palmitic Acid",
  //   "Glyceryl Stearate",
  //   "Triethanolamine",
  //   " Cera Alba (Beeswax)",
  //   "1,2-Hexanediol",
  //   "Sugar"
  // ];
  List<Ingredient> IngredientList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Product Name'),
      // bottomNavigationBar: BottomBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.04),
              child: TextField(
                  autofocus: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Name',
                    hintStyle: GoogleFonts.rambla(
                        color: Color(0xff283618),
                        fontSize: displayHeight(context) * 0.025,
                        fontStyle: FontStyle.italic),
                    fillColor: Color(0xffDADBC6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                            width: displayWidth(context) * 0.03,
                            style: BorderStyle.solid)),
                    filled: true,
                    contentPadding:
                    EdgeInsets.all(displayHeight(context) * 0.01),
                  )),
            ),
            ReemKufi_Green_Bold(
                textValue: 'Ingredients:', size: displayHeight(context) * 0.04),
            Expanded(
              child: ListView.builder(
                  itemCount: IngredientList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IngredientDetails(
                                ingredient: IngredientList[index])));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDADBC6),
                            borderRadius: BorderRadius.circular(
                                20), //border corner radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReemKufi_Green_Italic(
                                    textValue: IngredientList[index].ingredientName,
                                    size: displayHeight(context) * 0.02),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                IngredientDetails(
                                                    ingredient:
                                                    IngredientList[index]),
                                          ));
                                    },
                                    icon: Icon(Icons.arrow_forward_rounded)),
                              ],
                            ),
                          )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
