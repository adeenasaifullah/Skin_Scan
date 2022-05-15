

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/provider/scanned_product_provider.dart';
import 'package:skin_scan/provider/user_provider.dart';
import 'package:skin_scan/provider/categories_provider.dart';
import 'package:skin_scan/provider/google_sign_in.dart';
import 'package:skin_scan/provider/ingredient_provider.dart';
import 'package:skin_scan/provider/location_provider.dart';
import 'package:skin_scan/provider/product_provider.dart';
import 'package:skin_scan/services/auth.dart';
import 'package:skin_scan/utilities/utility.dart';
import 'package:camera/camera.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:ui';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math' as math;
import 'models/users_adeena_model.dart';
import 'log_in_sign_up_feature/log_in_register_screen.dart';
import 'services/auth.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  //Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      Provider<UserProvider>(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ChangeNotifierProvider(create: (_) => IngredientProvider()),
      ChangeNotifierProvider(create: (_) => LocationProvider()),
      ChangeNotifierProvider(create: (_) => ScannedProductProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  void initModified() async {
    await context.read<UserProvider>().getCurrentUserFromDb();
    await context.read<CategoryProvider>().getCategoriesFromDb();
    await context.read<ProductProvider>().getProductsFromDatabase();
    await context.read<UserProvider>().getUserFavouriteProducts(context.read<ProductProvider>().productsList);

  }

  @override
  void initState() {
    initModified();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<AuthenticateUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        //scaffoldMessengerKey: Utils.messengerKey,
        title: 'Skin Scan',
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
          ReemKufiOffwhite(textValue: "Skin Scan", size: displayHeight(context) * 0.05),
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
          // automaticallyImplyLeading: widget.backOption!,
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
            setState(() {

            });
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
