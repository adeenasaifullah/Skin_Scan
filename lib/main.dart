import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'package:skin_scan/LogIn.dart';
import 'package:skin_scan/MyProfile.dart';
import 'categoriesAndSearch.dart';
import 'editProfile.dart';
import 'ingredientDetails.dart';
import 'package:skin_scan/registerAndQuiz.dart';
import 'package:skin_scan/scan.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:camera/camera.dart';
import 'package:skin_scan/viewRoutines.dart';
import 'package:page_transition/page_transition.dart';
import 'map_demo.dart';
import 'dart:ui';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dart:async';
import 'package:custom_top_navigator/custom_top_navigator.dart';

import 'dart:math' as math;

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(ChangeNotifierProvider(
    create: (_) => routine_provider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogoScreen(),
    );
  }
}

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/skinscanlogolight.png',
              width: displayWidth(context) * 0.4,
              height: displayHeight(context) * 0.3),
          Text(
            "Skin Scan",
            style: GoogleFonts.reemKufi(
              color: const Color(0xFFFFFDF4),
              fontSize: displayHeight(context) * 0.05,
            ),
          ),
          Text(
            "Efficient and safe decisions for your skin!",
            style: GoogleFonts.reemKufi(
                color: const Color(0xFFFFFDF4),
                fontSize: displayWidth(context) * 0.03,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
      backgroundColor: const Color(0xFF283618),
      splashIconSize: 400,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      centered: true,
      nextScreen: progressloader(),
    );
  }
}

class progressloader extends StatefulWidget {
  const progressloader({Key? key}) : super(key: key);

  @override
  _progressloaderState createState() => _progressloaderState();
}

class _progressloaderState extends State<progressloader> {
  double? _height;
  double? _width;

  double percent = 0.0;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      print('Percent Update');
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer!.cancel();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => registerAndQuiz()));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF283618),
      body: Container(
        height: _height,
        width: _width,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 130,
                  width: 130,
                  child: LiquidCircularProgressIndicator(
                    value: percent / 100,
                    // Defaults to 0.5.
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFFFFDF4)),
                    backgroundColor: const Color(0xFF283618),
                    borderColor: const Color(0xff80876e),
                    borderWidth: 4.0,
                    direction: Axis.vertical,
                    center: Text(
                      percent.toString() + "%",
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff80876e)),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Loading",
                  style: GoogleFonts.reemKufi(
                    color: const Color(0xFFFFFDF4),
                    fontSize: displayHeight(context) * 0.04,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Path _buildBoatPath() {
    return Path()
      ..moveTo(15, 120)
      ..lineTo(0, 85)
      ..lineTo(50, 85)
      ..lineTo(60, 80)
      ..lineTo(60, 85)
      ..lineTo(120, 85)
      ..lineTo(105, 120)
      ..close();
  }

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
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ElevatedButton(
//                   onPressed: (){},
//                   child: Text("Layout 1")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => registerAndQuiz()));
//                   },
//                   child: Text("Layout 2")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => LogInScreen()));
//                   },
//                   child: Text("Layout 3")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => HomePageScreen()));
//                   },
//                   child: Text("Layout 4")),
//               ElevatedButton(
//                   onPressed: (){},
//                   child: Text("Layout 5")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => MyProfile()));
//                   },
//                   child: Text("Layout 6")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => editProfile()));
//                   },
//                   child: Text("Layout 7")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => CategoriesAndSearch()));
//                   },
//                   child: Text("Layout 8")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => IngredientDetails(ingredientName: 'Hyaluronic Acid',)));
//                   },
//                   child: Text("Layout 9")),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => ViewRoutine()
//                     ));
//                   },
//                   child: Text("Layout 10")),
//               ElevatedButton(
//                   onPressed: (){},
//                   child: Text("Layout 11")),
//             ],
//           )
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class TextValue extends StatelessWidget {
  final String text;
  final double textSize;
  final bool bold;
  const TextValue(
      {Key? key,
      required this.text,
      required this.textSize,
      required this.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.reemKufi(
        color: Color(0xFF283618),
        fontSize: textSize,
        fontWeight: bold ? FontWeight.bold : null,
      ),
    );
  }
}

class AppBarDetails extends StatefulWidget implements PreferredSizeWidget {
  final String screenName;
  const AppBarDetails({Key? key, required this.screenName}) : super(key: key);

  @override
  _AppBarDetailsState createState() => _AppBarDetailsState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}

class _AppBarDetailsState extends State<AppBarDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFFFFDF4),
      centerTitle: false,
      title: Text(widget.screenName,
          style: GoogleFonts.reemKufi(
              color: Color(0xFF4D4D4D),
              fontSize: displayHeight(context) * 0.03)),
      iconTheme: const IconThemeData(
        color: const Color(0xFF4D4D4D), //change your color here
      ),
      leading: GestureDetector(
        child: Icon(Icons.arrow_back, color: Color(0xFF4D4D4D)),
        onTap:() {Navigator.pop(context);}
      ),
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
    ));
  }
}

class BottomBar extends StatefulWidget implements PreferredSizeWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}

class _BottomBarState extends State<BottomBar> {
  TextEditingController ingredient_controller = TextEditingController();

  late TextEditingController derma_controller;
  void initState() {
    super.initState();

    derma_controller = TextEditingController();
  }

  void dispose() {
    ingredient_controller.dispose();
    derma_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Color(0xff4D4D4D),
      ),
      height: displayHeight(context) * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home_rounded),
            color: Color(0xffDADBC6),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()));
            },
          ),
          IconButton(
            icon: Image.asset('assets/dermatologistIcon.png'),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () async {
              return showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xff283618),
                        title: Text('Enter your area',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xffFFFDF4),
                                fontSize: displayHeight(context) * 0.04)),
                        content: TextField(
                          controller: derma_controller,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Enter your area',
                            hintStyle: GoogleFonts.reemKufi(
                                color: Color(0xffFFFDF4),
                                fontSize: displayHeight(context) * 0.03),
                          ),
                          style: GoogleFonts.reemKufi(
                              color: Color(0xffFFFDF4),
                              fontSize: displayHeight(context) * 0.03),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.all(displayHeight(context) * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffBBBD88)),
                                  child: Text('Yes',
                                      style: GoogleFonts.reemKufi(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.03)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        // MaterialPageRoute(builder: (context) =>
                                        //     Dermatologist(
                                        //       areaName: derma_controller.text,
                                        //
                                        //     ),)

                                        MaterialPageRoute(
                                          builder: (context) => MapDemo(),
                                        ));
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffBBBD88)),
                                  child: Text('Cancel',
                                      style: GoogleFonts.reemKufi(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.03)),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
            },
          ),
          IconButton(
            icon: Image.asset('assets/notepadthingyicon.png'),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewRoutine(),
                  ));
            },
          ),
          IconButton(
            icon: Image.asset('assets/ScanIcon.png'),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraApp(),
                  ));
            },
          ),
          IconButton(
            icon: Image.asset('assets/molecularICON.png'),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () async {
              return showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xff283618),
                        title: Text('Enter your ingredient',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xffFFFDF4),
                                fontSize: displayHeight(context) * 0.04)),
                        content: TextField(
                          controller: ingredient_controller,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Enter your ingredient',
                            hintStyle: GoogleFonts.reemKufi(
                                color: Color(0xffFFFDF4),
                                fontSize: displayHeight(context) * 0.03),
                          ),
                          style: GoogleFonts.reemKufi(
                              color: Color(0xffFFFDF4),
                              fontSize: displayHeight(context) * 0.03),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.all(displayHeight(context) * 0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffBBBD88)),
                                  child: Text('Continue',
                                      style: GoogleFonts.reemKufi(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.03)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              IngredientDetails(
                                            ingredientName:
                                                ingredient_controller.text,
                                          ),
                                        ));
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffBBBD88)),
                                  child: Text('Cancel',
                                      style: GoogleFonts.reemKufi(
                                          color: Colors.black,
                                          fontSize:
                                              displayHeight(context) * 0.03)),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.person),
            color: Color(0xffDADBC6),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyProfile()));
            },
          ),
        ],
      ),
    );
  }
}
