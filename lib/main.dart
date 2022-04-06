import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/HomePage.dart';
import 'package:skin_scan/LogIn.dart';
import 'package:skin_scan/MyProfile.dart';
import 'package:skin_scan/categoriesAndSearch.dart';
import 'package:skin_scan/editProfile.dart';
import 'package:skin_scan/ingredientDetails.dart';
import 'package:skin_scan/registerAndQuiz.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:camera/camera.dart';
import 'package:skin_scan/viewRoutines.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp( ChangeNotifierProvider(
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
    return  AnimatedSplashScreen(
      splash: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/skinscanlogolight.png',width: displayWidth(context)*0.4,height: displayHeight(context)*0.3),
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
                fontStyle: FontStyle.italic
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFF283618),
      splashIconSize: 400,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      centered: true,
      nextScreen: LoaderScreen(),
    );

  }
}




class LoaderScreen extends StatefulWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/14946-soona-blob.json'),
          Text(
            "Loading",
            style: GoogleFonts.reemKufi(
              color: const Color(0xFFFFFDF4),
              fontSize: displayHeight(context) * 0.05,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF283618),
      splashIconSize: 600,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      centered: true,
      nextScreen: registerAndQuiz(),
    );
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
  const TextValue({Key? key, required this.text, required this.textSize, required this.bold})
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
                  fontSize: displayHeight(context) * 0.04)),
          iconTheme: const IconThemeData(
            color: const Color(0xFF4D4D4D), //change your color here
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
                  width: displayWidth(context) * 0.1
              ),
            ),
          ],
        ));
  }
}
