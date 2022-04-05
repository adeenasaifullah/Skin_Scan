import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/LogIn.dart';
import 'package:skin_scan/MyProfile.dart';
import 'package:skin_scan/categoriesAndSearch.dart';
import 'package:skin_scan/editProfile.dart';
import 'package:skin_scan/ingredientDetails.dart';
import 'package:skin_scan/registerAndQuiz.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());



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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: const Color(0xFFFFFDF4)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Layout 1")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => registerAndQuiz()));
                  },
                  child: Text("Layout 2")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LogInScreen()));
                  },
                  child: Text("Layout 3")),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Layout 4")),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Layout 5")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyProfile()));
                  },
                  child: Text("Layout 6")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => editProfile()));
                  },
                  child: Text("Layout 7")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoriesAndSearch()));
                  },
                  child: Text("Layout 8")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IngredientDetails(ingredientName: 'Hyaluronic Acid',)));
                  },
                  child: Text("Layout 9")),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Layout 10")),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Layout 11")),
            ],
          )
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
