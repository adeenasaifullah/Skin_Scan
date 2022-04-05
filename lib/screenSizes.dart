import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          autofocus: true,
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
                                    // Navigator.push(context, MaterialPageRoute(
                                    //       builder: (context) => MapDemo(),
                                    //     ));
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
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/ScanIcon.png'),
            iconSize: displayHeight(context) * 0.05,
            onPressed: () {},
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
                          autofocus: true,
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
                                    // Navigator.push(context, MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           IngredientDetails(
                                    //         ingredientName:
                                    //             ingredient_controller.text!,
                                    //       ),
                                    //     ));
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
