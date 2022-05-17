import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/main.dart';
import '../provider/user_provider.dart';
import '../utilities/utility.dart';
import 'my_profile.dart';

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final emailController = TextEditingController();

  final nameController = TextEditingController();

  void initState() {
    //   // TODO: implement initState
    nameController.text = Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .UserName;
    emailController.text = Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .UserEmail;

    super.initState();
    //   myTask = widget.myTask;
  }

  @override
  Widget build(BuildContext context) {
    String currentName = Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .UserName;
    print("Current name is $currentName");
    String currentEmail = Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .UserEmail;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "Edit Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CircleAvatar(
                    //   radius: displayHeight(context) * 0.1,
                    //   backgroundImage: NetworkImage(
                    //       'https://media-exp1.licdn.com/dms/image/C4D03AQG8yHAYB2QZXg/profile-displayphoto-shrink_800_800/0/1604240249734?e=1652313600&v=beta&t=hqULr3Z0MtiRav1pRBW4zCPRWgIC9XPD0m5an6C1SoI'),
                    //   backgroundColor: Colors.transparent,
                    // ),
                    Container(
                      width: displayHeight(context) * 0.7,
                      child: Column(
                        children: [
                          SizedBox(height: displayHeight(context) * 0.08),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReemKufi_Green(
                                  textValue: "Name",
                                  size: displayHeight(context) * 0.03)
                            ],
                          ),
                          currentName != ""
                              ? TextFormField(
                                  autofocus: false,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                  controller: nameController,
                                )
                              : TextFormField(
                                  autofocus: false,
                                  cursorColor: Colors.black,
                                  //initialValue: "Please enter your name",
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                  controller: nameController,
                                ),

                          SizedBox(height: displayHeight(context) * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReemKufi_Green(
                                  textValue: "Email",
                                  size: displayHeight(context) * 0.03)
                            ],
                          ),
                          TextFormField(
                            autofocus: false,
                            cursorColor: Colors.black,
                            //initialValue: currentEmail,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                            ),
                            controller: emailController,
                          ),
                          SizedBox(height: displayHeight(context) * 0.20),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     ReemKufi_Green(textValue: "Date of birth", size: displayHeight(context)*0.03)
                          //
                          //   ],
                          // ),
                          // TextFormField(
                          //   autofocus: false,
                          //   initialValue: "12/04/2004",
                          //   cursorColor: Colors.black,
                          //   decoration: const InputDecoration(
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.black),
                          //     ),
                          //     focusedBorder: InputBorder.none,
                          //     contentPadding: EdgeInsets.only(
                          //         left: 15, bottom: 11, top: 11, right: 15),
                          //   ),
                          // ),
                          //SizedBox(height: displayHeight(context) * 0.03),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GreenButton(
                            buttonText: 'Save',
                            buttonWidth: displayWidth(context) * 0.3,
                            buttonHeight: displayHeight(context) * 0.07,
                            textSize: displayHeight(context) * 0.03,
                            onPressed: () async {
                              Provider.of<UserProvider>(context, listen: false).editProfile(nameController.text, emailController.text);
                              showDialog(
                                barrierDismissible: false,
                                context: context, // user must tap button!
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xff283618),
                                    title: Text('Changes saved!',
                                        style: GoogleFonts.reemKufi(
                                            color: Color(0xffFFFDF4),
                                            fontSize:
                                                displayHeight(context) * 0.04)),
                                    actions: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffFFFDF4)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Text('OK',
                                                    style: GoogleFonts.reemKufi(
                                                        color: Colors.black,
                                                        fontSize: displayHeight(
                                                                context) *
                                                            0.03)),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }),
                        SizedBox(width: displayHeight(context) * 0.1),
                        GreenButton(
                          buttonWidth: displayWidth(context) * 0.3,
                          buttonHeight: displayHeight(context) * 0.07,
                          buttonText: "Cancel",
                          textSize: displayHeight(context) * 0.03,
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyProfile()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
