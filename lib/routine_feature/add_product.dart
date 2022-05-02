import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/routine_feature/routine_feature_utilities.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../provider/routine_provider.dart';
import 'build_routine.dart';


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

  var boolvalues = [false, false, false, false, false, false, false];

  bool mastercheckbox = false;

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
                      child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                               StatefulBuilder(
                                 builder: (context, setState) {
                                   return CheckboxListTile(
                                      title: const Text('Choose all'),
                                      checkColor: Colors.black,
                                      activeColor: Colors.lightGreen,
                                      value: mastercheckbox,
                                      onChanged: (value) {
                                        setState(() {
                                          mastercheckbox = value!;
                                          boolvalues.forEach((boolvalue) {
                                            boolvalue = mastercheckbox;
                                          });
                                        });
                                      },
                                    );
                                 }
                               ),
                              StatefulBuilder(
                                builder: (context,setState) {
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
                                }
                              ),
                              CheckboxListTile(
                                  title: const Text('Tuesday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[1],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[1] = value!;
                                    });
                                  },
                                ),
                              CheckboxListTile(
                                  title: const Text('Wednesday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[2],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[2] = value!;
                                    });
                                  },
                                ),
                              CheckboxListTile(
                                  title: const Text('Thursday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[3],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[3] = value!;
                                    });
                                  },
                                ),
                             CheckboxListTile(
                                  title: const Text('Friday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[4],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[4] = value!;
                                    });
                                  },
                                ),
                               CheckboxListTile(
                                  title: const Text('Saturday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[5],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[5] = value!;
                                    });
                                  },
                                ),
                               CheckboxListTile(
                                  title: const Text('Sunday'),
                                  checkColor: Colors.black,
                                  activeColor: Colors.lightGreen,
                                  value: boolvalues[6],
                                  onChanged: (value) {
                                    setState(() {
                                      boolvalues[6] = value!;
                                    });
                                  },
                                )
                            ]),
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
                          Provider.of<RoutineProvider>(context, listen: false)
                              .addproductToRoutine(
                              widget.currentroutine, newproduct);
                          int j = context
                              .read<RoutineProvider>()
                              .routine_list
                              .indexWhere((routine) =>
                          routine.RoutineName ==
                              widget.currentroutine.RoutineName);
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop(true);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BuildRoutine(
                                  selectedroutine: context
                                      .read<RoutineProvider>()
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