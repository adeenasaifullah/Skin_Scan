import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/LogIn.dart';
import 'package:skin_scan/createAccount.dart';
import 'package:skin_scan/screenSizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      appBar: AppBarDetails(screenName: "My Profile"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(
              //   height: displayHeight(context) * 0.05,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextValue(text: "Afzal", textSize: 38 ,bold: true),
                      Row(children: [
                        TextValue(text: "Edit Profile", textSize: 25,bold: true),
                        Icon(Icons.create_rounded)
                      ])
                    ],
                  ),
                  Icon(Icons.face_rounded, color: Colors.black)
                ],
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  //height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDADBC6),
                    borderRadius:
                    BorderRadius.circular(20), //border corner radius
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.favorite, color: Colors.black),
                            Expanded(
                                child: TextValue(
                                    text: "Favourite Products", textSize: 18,bold: true)),
                            InkWell(
                              child: TextValue(text: "View All", textSize: 18,bold: true),
                              onTap: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.005,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.075,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                radius: 33,
                                backgroundColor: Color(0xFFC4C4C4),
                                child: Text("H"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.all(16),
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  //height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDADBC6),
                    borderRadius:
                    BorderRadius.circular(20), //border corner radius
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.history, color: Colors.black),
                            Expanded(
                                child: TextValue(
                                    text: "Scanned Products", textSize: 18,bold: true)),
                            InkWell(
                              child: TextValue(text: "View All", textSize: 18,bold: true),
                              onTap: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.005,
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.075,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                radius: 33,
                                backgroundColor: Color(0xFFC4C4C4),
                                child: Text("H"),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  //height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDADBC6),
                    borderRadius:
                    BorderRadius.circular(20), //border corner radius
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.history, color: Colors.black),
                            Expanded(
                                child: TextValue(
                                    text: "Skin Log History", textSize: 18,bold: true)),
                            InkWell(
                              child: TextValue(text: "View All", textSize: 18,bold: true),
                              onTap: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.black),
                            TextValue(text: "Not so good", textSize: 18,bold: true),
                            Icon(Icons.tag_faces, color: Colors.black)
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.black),
                            TextValue(text: "Not so good", textSize: 18,bold: true),
                            Icon(Icons.tag_faces, color: Colors.black)
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.005,
                        ),
                      ],
                    ),
                  )),
              ElevatedButton(
                  onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => createAccount())); },
                  child: Text("Next")
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () { Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => LogInScreen())); },
      //   child: Icon(Icons.add),
      // ),
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
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            //onTap: Navigator.pop(context),
          ),
          title: Text(widget.screenName,
              style: GoogleFonts.reemKufi(
                  color: Color(0xFF4D4D4D),
                  fontSize: displayHeight(context) * 0.05)),
          iconTheme: const IconThemeData(
            color: const Color(0xFF4D4D4D), //change your color here
          ),

        ));
  }
}
