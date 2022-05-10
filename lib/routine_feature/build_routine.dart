import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/routine_feature/routine_feature_utilities.dart';
import 'package:skin_scan/utilities/utility.dart';

import '../entities/routine_entities.dart';
import '../provider/routine_provider.dart';
import '../provider/user_provider.dart';
import 'add_product.dart';

class BuildRoutine extends StatefulWidget {
  BuildRoutine({Key? key, required this.selectedroutine}) : super(key: key);
  Routine selectedroutine;
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  _BuildRoutineState createState() => _BuildRoutineState();
}

class _BuildRoutineState extends State<BuildRoutine> {
  @override
  Widget build(BuildContext context) {
    int ind = context
        .read<UserProvider>()
        .allUsers
        .indexWhere((user) => user.userID == widget.currentUser.uid);
    int index = context
        .read<UserProvider>()
        .allUsers[ind]
        .UserRoutines
        .indexWhere((routine) =>
            routine.RoutineName == widget.selectedroutine.RoutineName);
    return Scaffold(
      appBar: AppBarDetails(
        screenName:
            "Your ${context.read<UserProvider>().allUsers[ind].UserRoutines[index].RoutineName} Routine",
        subtitle: "",
      ),
      backgroundColor: const Color(0xFFFFFDF4),
      body: (context
              .watch<UserProvider>()
              .allUsers[ind]
              .UserRoutines[index]
              .listofproducts
              .isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReemKufi_Green_Italic(
                    textValue: "Add products to your routine",
                    size: displayHeight(context) * 0.023,
                  ),
                  FloatingActionButton(
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFFFFFDF4),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddProduct(
                              currentroutine: context
                                  .read<UserProvider>()
                                  .allUsers[ind]
                                  .UserRoutines[index])));
                      setState(() {});
                    },
                    backgroundColor: const Color(0x000453e2),
                  )
                ],
              ),
            )
          : Column(children: [
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.15),
                    child: ReemKufi_Green_Italic(
                      textValue: "Add products to your routine",
                      size: displayHeight(context) * 0.023,
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context
                    .watch<UserProvider>()
                    .allUsers[ind]
                    .UserRoutines[index]
                    .listofproducts
                    .length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                displayWidth(context) * 0.07,
                                displayHeight(context) * 0.03,
                                displayWidth(context) * 0.06,
                                3),
                            child: Container(
                                height: displayHeight(context) * 0.06,
                                width: displayWidth(context) * 0.06,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF283618),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: ReemKufiOffwhite(
                                      textValue: (i + 1).toString(),
                                      size: displayHeight(context) * 0.026),
                                )),
                          ),
                          Container(
                              height: 80,
                              child: const VerticalDivider(
                                  color: const Color(0xFF283618))),
                          (i ==
                                  context
                                          .watch<UserProvider>()
                                          .allUsers[ind]
                                          .UserRoutines[index]
                                          .listofproducts
                                          .length -
                                      1)
                              ? Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      8, displayHeight(context) * 0.002, 8, 24),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.add,
                                      color: const Color(0xFF283618),
                                      size: displayHeight(context) * 0.05,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => AddProduct(
                                                  currentroutine: context
                                                      .read<UserProvider>()
                                                      .allUsers[ind]
                                                      .UserRoutines[index])));
                                    },
                                  ),
                                )
                              : Container(width: 0, height: 0),
                        ],
                      ), // first columns with numbers and lines

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                displayWidth(context) * 0.03,
                                displayHeight(context) * 0.04,
                                displayWidth(context) * 0.08,
                                1),
                            child: Container(
                              height: displayHeight(context) * 0.16,
                              width: displayHeight(context) * 0.18,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFDADBC6),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  )),
                            ),
                          ),
                          (i ==
                                  context
                                          .watch<UserProvider>()
                                          .allUsers[ind]
                                          .UserRoutines[index]
                                          .listofproducts
                                          .length -
                                      1)
                              ? Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      8, displayHeight(context) * 0.002, 8, 24),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.transparent,
                                    size: displayHeight(context) * 0.05,
                                  ),
                                )
                              : Container(width: 0, height: 0),
                        ],
                      ), // second column with product pictures

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0,
                                displayHeight(context) * 0.04,
                                displayWidth(context) * 0.1,
                                0),
                            child: Container(
                              height: displayHeight(context) * 0.04,
                              width: displayWidth(context) * 0.18,
                              child: Center(
                                child: ReemKufi_Green_Bold(
                                  textValue: context
                                      .read<UserProvider>()
                                      .allUsers[ind]
                                      .UserRoutines[index]
                                      .listofproducts[
                                          i] // there are two i indexes being used. correct this and replace second index with another name
                                      .category,
                                  size: displayHeight(context) * 0.02,
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFDADBC6),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(11.0),
                                    topRight: Radius.circular(11.0),
                                    bottomLeft: Radius.circular(11.0),
                                    bottomRight: Radius.circular(11.0),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                displayWidth(context) * 0.005,
                                0.55,
                                displayWidth(context) * 0.1,
                                0.5),
                            child: Container(
                              height: displayHeight(context) * 0.12,
                              width: displayWidth(context) * 0.17,
                              decoration: const BoxDecoration(
                                  //color: Color(0xFFDADBC6),
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11.0),
                                topRight: Radius.circular(11.0),
                                bottomLeft: Radius.circular(11.0),
                                bottomRight: Radius.circular(11.0),
                              )),
                              child: Center(
                                child: ReemKufi_Green_Bold(
                                    textValue: context
                                        .watch<UserProvider>()
                                        .allUsers[ind]
                                        .UserRoutines[index]
                                        .listofproducts[i]
                                        .productname,
                                    size: displayHeight(context) * 0.018),
                              ),
                            ),
                          ),
                          (i ==
                                  context
                                          .watch<UserProvider>()
                                          .allUsers[ind]
                                          .UserRoutines[index]
                                          .listofproducts
                                          .length -
                                      1)
                              ? Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      8, displayHeight(context) * 0.002, 8, 24),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.transparent,
                                    size: displayHeight(context) * 0.05,
                                  ),
                                )
                              : Container(width: 0, height: 0),
                        ],
                      ),
                    ],
                  );
                },
              )),
              //const BottomBar()
            ]),
    );
  }
}
