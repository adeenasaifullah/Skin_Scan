import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'MyBottomAppBar.dart';
import 'main.dart';
import 'screenSizes.dart';

class ViewRoutine extends StatefulWidget {
  ViewRoutine({Key? key}) : super(key: key);

  List<Routine> allroutines = [];
  @override
  _ViewRoutineState createState() => _ViewRoutineState();
}

class _ViewRoutineState extends State<ViewRoutine> {
  @override
  Widget build(BuildContext context) {
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
        body: (context.read<routine_provider>().routine_list.isEmpty)
            ? Column(
                children: [
                  const TextValue(
                      text: "Click here to build a routine",
                      textSize: 20,
                      bold: true),
                  FloatingActionButton(
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFFFFFDF4),
                    ),
                    onPressed: () {
                      //print("adding routine");
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
                          itemCount: context
                              .read<routine_provider>()
                              .routine_list
                              .length,
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
                                      (context
                                                  .read<routine_provider>()
                                                  .routine_list[index]
                                                  .time ==
                                              "AM")
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
                                      ReemKufi_Green(textValue: context
                                          .read<routine_provider>()
                                          .routine_list[index]
                                          .RoutineName,size: displayHeight(context)*0.04, ),

                                      ReemKufi_Green(textValue: "Number of products: ${context.read<routine_provider>().routine_list[index].numofproducts.toString()}"
                                        ,size: displayHeight(context)*0.02, ),


                                      Divider(
                                          height: displayWidth(context) * 0.04),

                                      InkWell(
                                        child: ReemKufi_Green_Bold(textValue:"View",size: displayHeight(context)*0.026, ),
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => BuildRoutine(
                                                  selectedroutine: context
                                                      .read<routine_provider>()
                                                      .routine_list[index])));
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
                                          selectedroutine: context
                                              .read<routine_provider>()
                                              .routine_list[index])));
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

class BuildRoutine extends StatefulWidget {
  BuildRoutine({Key? key, required this.selectedroutine}) : super(key: key);
  Routine selectedroutine;

  @override
  _BuildRoutineState createState() => _BuildRoutineState();
}

class _BuildRoutineState extends State<BuildRoutine> {
  @override
  Widget build(BuildContext context) {
    int index = context.read<routine_provider>().routine_list.indexWhere(
        (routine) => routine.RoutineName == widget.selectedroutine.RoutineName);
    return Scaffold(
      appBar: AppBarDetails(
        screenName:
            "Your ${context.read<routine_provider>().routine_list[index].RoutineName}",
        subtitle: "",
      ),
      backgroundColor: const Color(0xFFFFFDF4),
      body: (context
              .read<routine_provider>()
              .routine_list[index]
              .listofproducts
              .isEmpty)
          ? Center(
              child: Column(
                children: [
                  const TextValue(
                      text: "Add a product to your routine",
                      textSize: 20,
                      bold: true),
                  FloatingActionButton(
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFFFFFDF4),
                    ),
                    onPressed: () {
                      //print("adding routine");
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
                    child: ReemKufi_Green_Italic(textValue: "Add products to your routine",
                    size: displayHeight(context)*0.023, ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context
                    .read<routine_provider>()
                    .routine_list[index]
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
                                    child: ReemKufiOffwhite(textValue: (i + 1).toString(), size: displayHeight(context) * 0.026),
                                )
                            ),
                          ),
                          Container(
                              height: 80,
                              child: const VerticalDivider(
                                  color: const Color(0xFF283618))),
                          (i ==
                                  context
                                          .read<routine_provider>()
                                          .routine_list[index]
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
                                                      .read<routine_provider>()
                                                      .routine_list[index])));
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
                                          .read<routine_provider>()
                                          .routine_list[index]
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
                                child: ReemKufi_Green_Bold(textValue: context
                                    .read<routine_provider>()
                                    .routine_list[index]
                                    .listofproducts[i]
                                    .category , size: displayHeight(context) * 0.02,),

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
                                child: ReemKufi_Green_Bold(textValue: context
                                    .read<routine_provider>()
                                    .routine_list[index]
                                    .listofproducts[i]
                                    .productname , size:displayHeight(context) * 0.018),
                              ),
                            ),
                          ),
                          (i ==
                                  context
                                          .read<routine_provider>()
                                          .routine_list[index]
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

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key, required this.currentroutine}) : super(key: key);

  final Routine currentroutine;
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late String pname;
  late String category;
  late List<String> days;

  @override
  Widget build(BuildContext context) {
    TextEditingController productcontroller = TextEditingController();
    // Initial Selected Value
    String? dropdownvalue = 'Choose';

    // List of items in our dropdown menu
    var items = [
      'Choose',
      'Moisturizer',
      'Toner',
      'Serum',
      'Suncare',
      'Mask',
      'Exfoliator',
    ];

    var days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    var boolvalues = [false, false, false, false, false, false, false];

    bool mastercheckbox = false;

    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarDetails(screenName: "Add a product", subtitle: ""),
        backgroundColor: const Color(0xFFFFFDF4),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: displayWidth(context) * 0.6,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ReemKufi_Green(textValue: "Product name: ", size: displayWidth(context) * 0.035),
                  SizedBox(
                    width: displayWidth(context) * 0.05,
                  ),
                  Expanded(
                    child: StatefulBuilder(builder: (context, setState) {
                      return TextField(
                        controller: productcontroller,
                        autofocus: false,
                        decoration: InputDecoration(
                          //hintText: 'product',
                          hintStyle: GoogleFonts.reemKufi(
                              color: const Color(0xFF283618),
                              fontSize: displayWidth(context) * 0.03),
                        ),
                        style: GoogleFonts.reemKufi(
                            color: const Color(0xFF283618),
                            fontSize: displayWidth(context) * 0.03),
                        onChanged: (text) {
                          pname = productcontroller.text;
                          print(pname);
                          setState(() {});
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
            SizedBox(height: displayHeight(context) * 0.02),
            Container(
              width: displayWidth(context) * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ReemKufi_Green(textValue: "Category: ", size: displayWidth(context) * 0.035),
                  SizedBox(
                    width: displayWidth(context) * 0.05,
                  ),
                  StatefulBuilder(builder: (context, setState) {
                    return DropdownButton(
                      // Initial Value
                      focusColor: Color(0xff283618),
                      dropdownColor: Color(0xff283618),
                      value: dropdownvalue,
                      alignment: AlignmentDirectional.center,

                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF283618),
                      ),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Center(
                              child: Text(items,
                                  style: TextStyle(
                                    color: Color(0xffBBBD88),
                                  ))),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue! as String?;
                          category = dropdownvalue!;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReemKufi_Green(textValue: "Choose your days: ", size: displayWidth(context) * 0.04),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: displayHeight(context) * 0.5,
                child: Column(
                  children: [
                    // SizedBox(width:10),
                    Expanded(
                      child: StatefulBuilder(builder: (context, setState) {
                        return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              // StatefulBuilder(builder: (context, setState) {
                              //   return CheckboxListTile(
                              //     title: const Text('Choose all'),
                              //     checkColor: Colors.black,
                              //     activeColor: Colors.lightGreen,
                              //     value: mastercheckbox,
                              //     onChanged: (value) {
                              //       setState(() {
                              //         mastercheckbox = value!;
                              //         boolvalues.forEach((boolvalue) {
                              //           boolvalue = mastercheckbox;
                              //         });
                              //       });
                              //     },
                              //   );
                              // }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Monday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[0],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[0] = value!;
                                    });
                                  },
                                );
                              }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Tuesday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[1],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[1] = value!;
                                    });
                                  },
                                );
                              }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Wednesday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[2],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[2] = value!;
                                    });
                                  },
                                );
                              }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Thursday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[3],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[3] = value!;
                                    });
                                  },
                                );
                              }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Friday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[4],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[4] = value!;
                                    });
                                  },
                                );
                              }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Saturday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[5],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[5] = value!;
                                    });
                                  },
                                );
                              }),
                              StatefulBuilder(builder: (context, setState) {
                                return CheckboxListTile(
                                  title: const Text('Sunday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[6],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[6] = value!;
                                    });
                                  },
                                );
                              })
                            ]);
                      }),
                    ),
                  ],
                ),
              ),
            )

            // Checkbox(
            //   activeColor: Colors.black,
            //   checkColor: Colors.white10,
            //   value: boolvalues[index],
            //   onChanged: (value) {
            //     setState(() {
            //       boolvalues[index] = value!;
            //     });
            //   },
            // ),
            ,
            Expanded(
              child: SizedBox(
                width: displayWidth(context) * 0.4,
                height: displayHeight(context) * 0.02,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StatefulBuilder(builder: (context, setState) {
                      return TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff283618)),
                        child: Text('Save',
                            style: GoogleFonts.reemKufi(
                                color: Color(0xffBBBD88),
                                fontSize: displayHeight(context) * 0.03)),
                        onPressed: () {
                          List<String> pdays = [];
                          for (var i = 0; i < 7; i++) {
                            if (boolvalues[i] == true) {
                              pdays.add(days[i]);
                            }
                          }
                          Product newproduct = Product(
                              productname: pname,
                              category: category,
                              days: pdays);
                          Provider.of<routine_provider>(context, listen: false)
                              .addproductToRoutine(
                                  widget.currentroutine, newproduct);
                          int j = context
                              .read<routine_provider>()
                              .routine_list
                              .indexWhere((routine) =>
                                  routine.RoutineName ==
                                  widget.currentroutine.RoutineName);
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop(true);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BuildRoutine(
                                  selectedroutine: context
                                      .read<routine_provider>()
                                      .routine_list[j])));
                        },
                      );
                    }),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffBBBD88)),
                      child: Text('Cancel',
                          style: GoogleFonts.reemKufi(
                              color: Colors.black,
                              fontSize: displayHeight(context) * 0.03)),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 0),
            //   child: BottomBar(),
            // )
          ],
        ),
      );
    });
  }
}

class routine_provider extends ChangeNotifier {
  List<Routine> routine_list = [];

  routine_provider() {
    List<String> productdays = ["Monday", "Wednesday", "Friday", "Sunday"];
    Product AMproduct1 = Product(
        productname: "Caquina Moisturizer",
        category: "Moisturizer",
        days: ["Monday", "Wednesday", "Friday", "Sunday"]);

    Product AMproduct2 = Product(
        productname: "Caquina Toner", category: "Toner", days: productdays);
    Product AMproduct3 = Product(
        productname: "Clarins Sunscreen",
        category: "Sunscreen",
        days: productdays);

    Routine AMroutine = Routine(RoutineName: "Morning Routine", time: "AM");

    AMroutine.listofproducts.add(AMproduct1);
    AMroutine.listofproducts.add(AMproduct2);
    AMroutine.listofproducts.add(AMproduct3);
    AMroutine.numofproducts = AMroutine.listofproducts.length;
    routine_list.add(AMroutine);

    Product PMproduct1 = Product(
        productname: "CeraVe Moisturizer",
        category: "Moisturizer",
        days: productdays);
    Product PMproduct2 = Product(
        productname: "Caquina Phool Proof",
        category: "Toner",
        days: productdays);
    Product PMproduct3 = Product(
        productname: "The Ordinary Vit C",
        category: "Serum",
        days: productdays);
    Product PMproduct4 = Product(
        productname: "Paula's Choice BHA Solution",
        category: "Exfoliator",
        days: productdays);

    Routine PMroutine = Routine(RoutineName: "Night Routine", time: "PM");
    PMroutine.listofproducts.add(PMproduct1);
    PMroutine.listofproducts.add(PMproduct2);
    PMroutine.listofproducts.add(PMproduct3);
    PMroutine.listofproducts.add(PMproduct4);
    PMroutine.numofproducts = PMroutine.listofproducts.length;
    routine_list.add(PMroutine);
  }

  Future<void> addroutine(String name, String time) async {
    Routine newroutine = Routine(RoutineName: name, time: time);
    routine_list.add(newroutine);
    notifyListeners();
  }

  Future<void> addproductToRoutine(Routine x, Product P) async {
    int index = routine_list
        .indexWhere((routine) => routine.RoutineName == x.RoutineName);
    routine_list[index].listofproducts.add(P);
    routine_list[index].numofproducts = routine_list[index].numofproducts + 1;
    notifyListeners();
  }
}

class Routine extends StatefulWidget {
  Routine({Key? key, required this.RoutineName, required this.time})
      : super(key: key);

  final String RoutineName;
  List<Product> listofproducts = [];
  final String time;
  int numofproducts = 0;

  @override
  _RoutineState createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Product extends StatefulWidget {
  Product(
      {Key? key,
      required this.productname,
      required this.category,
      required this.days})
      : super(key: key);

  final String productname;
  final String category;
  List<String> days = [];
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// utility widgets
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
        color: const Color(0xFF283618),
        fontSize: textSize,
        fontWeight: bold ? FontWeight.bold : null,
      ),
    );
  }
}

class AppBarDetails extends StatefulWidget implements PreferredSizeWidget {
  final String screenName;
  final String subtitle;
  const AppBarDetails(
      {Key? key, required this.screenName, required this.subtitle})
      : super(key: key);

  @override
  _AppBarDetailsState createState() => _AppBarDetailsState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarDetailsState extends State<AppBarDetails> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFDF4),
          //centerTitle: true,
          leading: InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pop(context);
              }),
          title: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: "\n${widget.screenName}",
                  style: GoogleFonts.reemKufi(
                      color: const Color(0xFF4D4D4D),
                      fontSize: displayWidth(context) * 0.05),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\n${widget.subtitle}",
                      style: GoogleFonts.reemKufi(
                          color: const Color(0xFF283618),
                          fontSize: displayHeight(context) * 0.02,
                          fontStyle: FontStyle.italic),
                    )
                  ])),
          iconTheme: const IconThemeData(
            color: Color(0xFF4D4D4D), //change your color here
          )),
    );
  }
}
