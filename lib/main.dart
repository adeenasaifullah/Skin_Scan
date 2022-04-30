import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/provider/categories_provider.dart';
import 'package:skin_scan/provider/google_sign_in.dart';
import 'package:skin_scan/provider/product_provider.dart';
import 'package:skin_scan/provider/routine_provider.dart';
import 'package:skin_scan/register_feature/account_created.dart';
import 'package:skin_scan/services/auth.dart';
import 'package:skin_scan/utilities/utility.dart';
import 'package:camera/camera.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:ui';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:custom_top_navigator/custom_top_navigator.dart';

import 'dart:math' as math;

import 'Models/users_model.dart';
import 'log_in_sign_up_feature/log_in_register_screen.dart';
import 'services/auth.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  //Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(MultiProvider(
    providers: [
      Provider<RoutineProvider>(create: (_) => RoutineProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      //Provider<AuthService>(create: (_) => AuthService(FirebaseAuth.instance)),
      //StreamProvider(create: (context) => context.read<AuthService>().authStateChanges, initialData: null,),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Load all your data from firebase over here:
    context.read<CategoryProvider>().getCategoriesFromDb();
    context.read<ProductProvider>().getProductsFromDatabase();

    //FocusScope.of(context).unfocus();
    return StreamProvider<AuthenticateUser?>.value(
      value: AuthService().user,
      initialData: null,
      //GestureDetector(
      // onTap: () {
      //   FocusScopeNode currentFocus = FocusScope.of(context);
      //
      //   if (!currentFocus.hasPrimaryFocus) {
      //     currentFocus.unfocus();
      //   }
      // },
      child: MaterialApp(
        //scaffoldMessengerKey: Utils.messengerKey,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LogoScreen(),
      ),
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
          ReemKufiOffwhite(
              textValue: "Skin Scan", size: displayHeight(context) * 0.05),
          ReemKufiOffwhite_Italic(
              textValue: "Efficient and safe decisions for your skin!",
              size: displayWidth(context) * 0.03),
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
    timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      //print('Percent Update');
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer!.cancel();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LogInRegisterScreen()));
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
                ReemKufiOffwhite(
                    textValue: "Loading...",
                    size: displayHeight(context) * 0.04),
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
      title: ReemKufi_Grey(
          textValue: widget.screenName, size: displayHeight(context) * 0.03),
      iconTheme: const IconThemeData(
        color: const Color(0xFF4D4D4D), //change your color here
      ),
      leading: GestureDetector(
          child: Icon(Icons.arrow_back, color: Color(0xFF4D4D4D)),
          onTap: () {
            Navigator.pop(context);
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
    ));
  }
}
