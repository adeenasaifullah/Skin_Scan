import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/profile_feature/scanned_products.dart';
import 'package:skin_scan/profile_feature/skin_log_history.dart';
import '../entities/product_entities.dart';
import '../provider/product_provider.dart';
import '../provider/user_provider.dart';
import '../utilities/bottom_app_bar.dart';
import '../utilities/utility.dart';
import 'edit_profile.dart';
import 'favourite_products.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<Product> productsList = [];
  List<Product> FavouriteLists = [];

  @override
  Widget build(BuildContext context) {
    String currentName = Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .UserName;
    productsList = context.read<ProductProvider>().getProducts;
    FavouriteLists= context
        .watch<UserProvider>()
        .getUserFavouriteProducts(productsList);


    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFFDF4),
        centerTitle: false,
        title: ReemKufi_Grey(textValue:"My Profile", size: displayHeight(context) * 0.04),

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      currentName == "" ?
                      ReemKufi_Green_Bold(textValue:  "", size: displayHeight(context) * 0.05)
                      :
                      ReemKufi_Green_Bold(textValue:currentName, size: displayHeight(context) * 0.05),
                      Row(children: [
                        ReemKufi_Green_Bold(textValue: "Edit Profile", size: displayHeight(context) * 0.03),
                        InkWell(
                          child: Icon(Icons.create_rounded),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => editProfile()));
                          },
                        )
                      ])
                    ],
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.1,
                  ),
                  CircleAvatar(
                    radius: displayHeight(context) * 0.075,
                    backgroundImage: NetworkImage(
                        'https://media-exp1.licdn.com/dms/image/C4D03AQG8yHAYB2QZXg/profile-displayphoto-shrink_800_800/0/1604240249734?e=1652313600&v=beta&t=hqULr3Z0MtiRav1pRBW4zCPRWgIC9XPD0m5an6C1SoI'),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
              SizedBox(
                height: displayHeight(context) * 0.025,
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  //height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDADBC6),
                    borderRadius:
                    BorderRadius.circular(15), //border corner radius
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
                                child: ReemKufi_Green_Bold(textValue: "Favourite Products", size: displayHeight(context) * 0.0225)),
                            InkWell(
                              child: ReemKufi_Green_Bold(textValue: "View All", size: displayHeight(context) * 0.0225),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FavouriteProducts()));
                              },
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
                            itemCount: FavouriteLists.length,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                  radius: 33,
                                  backgroundColor: Color(0xffC4C4C4),
                                  child: ReemKufi_Green(size: displayHeight(context) * 0.0125, textValue: FavouriteLists[index].productName,)

                                  // child: Image(
                                  //   image: AssetImage('assets/Favourite.png'),
                                  //   fit: BoxFit.fill,
                                  //   height: displayHeight(context) * 0.065,
                                  //   width: displayWidth(context) * 0.065,
                                  // )
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
                    BorderRadius.circular(15), //border corner radius
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
                                child: ReemKufi_Green_Bold(textValue: "Scanned Products", size: displayHeight(context) * 0.0225)),
                            InkWell(
                              child: ReemKufi_Green_Bold(textValue: "View All", size: displayHeight(context) * 0.0225),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ScannedProducts()));
                              },
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
                                  backgroundColor: Color(0xffC4C4C4),
                                  child: Image(
                                    image: AssetImage('assets/Favourite.png'),
                                    fit: BoxFit.fill,
                                    height: displayHeight(context) * 0.065,
                                    width: displayWidth(context) * 0.065,
                                  ));
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
                    BorderRadius.circular(15), //border corner radius
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
                                child: ReemKufi_Green_Bold(textValue: "Skin Log History", size: displayHeight(context) * 0.0225)),
                            InkWell(
                              child: ReemKufi_Green_Bold(textValue: "View All", size: displayHeight(context) * 0.0225),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SkinLogHistory()));
                              },
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
                            ReemKufi_Green_Bold(textValue: "Not so good", size: displayHeight(context) * 0.0225),
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
                            ReemKufi_Green_Bold(textValue: "Not so good", size: displayHeight(context) * 0.0225),
                            Icon(Icons.tag_faces, color: Colors.black)
                          ],
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.005,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
