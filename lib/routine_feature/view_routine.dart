
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/provider/user_provider.dart';
import 'package:skin_scan/routine_feature/routine_feature_utilities.dart';
import 'package:skin_scan/utilities/bottom_app_bar.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../entities/routine_entities.dart';
import '../provider/routine_provider.dart';
import 'build_routine.dart';

class ViewRoutine extends StatefulWidget {
  ViewRoutine({Key? key}) : super(key: key);


  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  _ViewRoutineState createState() => _ViewRoutineState();
}

class _ViewRoutineState extends State<ViewRoutine> {
  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int i = context.read<UserProvider>().allUsers.indexWhere((user) => user.userID == widget.currentUser.uid);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFDF4),
          centerTitle: false,
          title: Text("Your Skincare Routines",
            style: GoogleFonts.reemKufi(
                color: Color(0xFF4D4D4D),
                fontSize: displayWidth(context) * 0.05),),
          iconTheme: const IconThemeData(
            color: const Color(0xFF4D4D4D), //change your color here
          ),
          leading: GestureDetector(

              child: Icon(Icons.arrow_back, color: Color(0xFF4D4D4D)),
              onTap:() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyBottomAppBar(),
                  ),
                      (route) => false,
                );

              }
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
        ),
        backgroundColor: const Color(0xFFFFFDF4),
        body: (context.read<UserProvider>().allUsers[i].UserRoutines.isEmpty)
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const TextValue(
            //     text: "Click here to build a routine",
            //     textSize: 20,
            //     bold: true),
            FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Color(0xFFFFFDF4),
              ),
              onPressed: () {


              },
              backgroundColor: const Color(0x000453e2),
            )
          ],
        )
            : Column(
          children: [
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: context.read<UserProvider>().allUsers[i].UserRoutines.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.fromLTRB(80, 20, 80, 20),
                        child: InkWell(
                          child: Container(
                            height: displayHeight(context) * 0.3,
                            width: displayWidth(context) * 0.1,
                            padding:
                            const EdgeInsets.fromLTRB(5, 0.8, 5, 2),
                            decoration: const BoxDecoration(
                                color: Color(0xFFDADBC6),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                )),
                            //color: const Color(0xFFDADBC6),
                            child: Column(
                              children: [
                                // relevant icon
                                (context.read<UserProvider>().allUsers[i]
                                    .UserRoutines[index].RoutineName==
                                    "Morning")
                                    ? const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Align(
                                      alignment:
                                      Alignment.topCenter,
                                      child: Icon(
                                          Icons.wb_sunny_outlined,
                                          size: 54,
                                          color:
                                          Color(0xFF283618))),
                                )
                                    : const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Align(
                                      alignment:
                                      Alignment.topCenter,
                                      child: Icon(
                                          Icons
                                              .nights_stay_outlined,
                                          size: 54,
                                          color:
                                          Color(0xFF283618))),
                                ),
                                ReemKufi_Green(textValue: "${context.read<UserProvider>().allUsers[i].UserRoutines[index]
                                    .RoutineName} Routine",size: displayHeight(context)*0.04, ),

                                ReemKufi_Green(textValue: "Number of products: ${context.read<UserProvider>().allUsers[i].UserRoutines[index].listofproducts.length.toString()}"
                                  ,size: displayHeight(context)*0.02, ),



                                Divider(
                                    height: displayWidth(context) * 0.04),

                                InkWell(
                                  child: ReemKufi_Green_Bold(textValue:"View",size: displayHeight(context)*0.026, ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => BuildRoutine(
                                            selectedroutine: context.read<UserProvider>().allUsers[i].UserRoutines[index])));
                                    setState(() {});
                                  },
                                ),

                                // routine name
                                // number of products
                                // line
                                // view clickable text
                                // display routine information here
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BuildRoutine(
                                    selectedroutine: context.read<UserProvider>().allUsers[i].UserRoutines[index])));
                            setState(() {});
                          },
                        ),
                      );
                    })),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8, 5, 8, 24),
            //   child: FloatingActionButton(
            //     child: const Icon(
            //       Icons.add,
            //       color: Color(0xFFFFFDF4),
            //     ),
            //     onPressed: () {
            //       //print("adding routine");
            //     },
            //     backgroundColor: const Color(0xFF283618),
            //   ),
            // ),
            // const BottomBar(),
          ],
        ));
  }
}