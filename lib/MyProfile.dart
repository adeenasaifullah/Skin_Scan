import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_scan/editProfile.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'categoriesAndSearch.dart';
import 'main.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
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
                      TextValue(text: "Afzal     ", textSize: 38, bold: true),
                      Row(children: [
                        TextValue(
                            text: "Edit Profile", textSize: 25, bold: true),
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
                  //Icon(Icons.face_rounded, color: Colors.black)
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
                                    text: "Favourite Products",
                                    textSize: 18,
                                    bold: true)),
                            InkWell(
                              child: TextValue(
                                  text: "View All", textSize: 18, bold: true),
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
                            itemCount: 5,
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
                                    text: "Scanned Products",
                                    textSize: 18,
                                    bold: true)),
                            InkWell(
                              child: TextValue(
                                  text: "View All", textSize: 18, bold: true),
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
                                    text: "Skin Log History",
                                    textSize: 18,
                                    bold: true)),
                            InkWell(
                              child: TextValue(
                                  text: "View All", textSize: 18, bold: true),
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
                            TextValue(
                                text: "Not so good", textSize: 18, bold: true),
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
                            TextValue(
                                text: "Not so good", textSize: 18, bold: true),
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
      bottomNavigationBar: BottomBar(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({Key? key}) : super(key: key);

  @override
  _FavouriteProductsState createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  final List<FavouriteProductsCard> FavouriteLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "Paula's Choice",
      productRating: 4,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "CoNatural",
      productRating: 3,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "Niacis",
      productRating: 5,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "The Ordinary",
      productRating: 4,
    ));
    FavouriteLists.add(FavouriteProductsCard(
      productImage: 'assets/Favourite.png',
      productName: "Vitamin C",
      productRating: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: 'Favourite Products'),
      backgroundColor: Color(0xFFFFFDF4),
      //body: SingleChildScrollView(
      //child: Column(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayHeight(context) * 0.02),
            Expanded(
              child: GridView.count(
                childAspectRatio:
                    displayWidth(context) / displayHeight(context) * 1.6,
                //crossAxisSpacing: 12,
                //mainAxisSpacing: 12,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: List.generate(
                    FavouriteLists.length,
                    (index) => FavouriteProductsCard(
                          productImage: FavouriteLists[index].productImage,
                          productName: FavouriteLists[index].productName,
                          productRating: FavouriteLists[index].productRating,
                        )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class FavouriteProductsCard extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productRating;

  const FavouriteProductsCard(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productRating})
      : super(key: key);

  @override
  _FavouriteProductsCardState createState() => _FavouriteProductsCardState();
}

class _FavouriteProductsCardState extends State<FavouriteProductsCard> {
  late int _rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: InkWell(
          child: Card(
              elevation: 2,
              color: Color(0xFFDADBC6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.25),

                    child: IconButton(
                        onPressed: () async {
                          return showDialog(
                            barrierDismissible: false,
                            context: context, // user must tap button!
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xff283618),
                                title: Text(
                                    'Are you sure you want to unfavourite this product?',
                                    style: GoogleFonts.reemKufi(
                                        color: Color(0xffFFFDF4),
                                        fontSize:
                                            displayHeight(context) * 0.04)),
                                actions: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(
                                        displayHeight(context) * 0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffFFFDF4)),
                                          child: Text('Yes',
                                              style: GoogleFonts.reemKufi(
                                                  color: Colors.black,
                                                  fontSize:
                                                      displayHeight(context) *
                                                          0.03)),
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffBBBD88)),
                                          child: Text('Cancel',
                                              style: GoogleFonts.reemKufi(
                                                  color: Colors.black,
                                                  fontSize:
                                                      displayHeight(context) *
                                                          0.03)),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.favorite, color: Colors.black)),
                  ),
                  Image(
                      image: AssetImage(widget.productImage),
                      fit: BoxFit.fill,
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.1),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Text(widget.productName,
                      style: GoogleFonts.reemKufi(
                          color: Color(0xff283618),
                          fontSize: displayHeight(context) * 0.025)),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rating(
                    productRating: widget.productRating,
                  ),
                  // SizedBox(height: displayHeight(context) * 0.005),
                ],
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(productPrice: 2500, productImage: widget.productImage, productName: widget.productName,),
              ),
            );
          },
        ));
  }
}

class Rating extends StatefulWidget {
  final int productRating;
  const Rating({Key? key, required this.productRating}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: displayHeight(context) * 0.03,
      initialRating: widget.productRating.toDouble(),
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Color(0xff283618),
        ),
        half: Icon(
          Icons.star_border,
          color: Color(0xff283618),
        ),
        empty: Icon(
          Icons.star_border,
          color: Color(0xff283618),
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class ScannedProducts extends StatefulWidget {
  const ScannedProducts({Key? key}) : super(key: key);

  @override
  _ScannedProductsState createState() => _ScannedProductsState();
}

class _ScannedProductsState extends State<ScannedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: "Scanned Products"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayHeight(context) * 0.02),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDADBC6),
                          borderRadius:
                              BorderRadius.circular(20), //border corner radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Image(
                                    image: AssetImage('assets/Favourite.png'),
                                    fit: BoxFit.fill,
                                    height: displayHeight(context) * 0.085,
                                    width: displayWidth(context) * 0.085),
                                minRadius: 35,
                                backgroundColor: Color(0xffC4C4C4),
                              ),
                              TextValue(
                                  text: "Super Nova Supreme",
                                  textSize: 18,
                                  bold: false),
                              // Image(
                              //     image: AssetImage('assets/Favourite.png'),
                              //     fit: BoxFit.fill,
                              //     height: displayHeight(context) * 0.1,
                              //     width: displayWidth(context) * 0.1),
                              Container(
                                height: displayHeight(context)*0.07,
                                width: displayWidth(context)*0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffC4C4C4),
                                  border: Border.all(
                                    color: Color(0xffC4C4C4),  // red as border color
                                  ),
                                ),
                                child: Column(
                                    children: <Widget>[
                                  SizedBox(child: Text("14", style:GoogleFonts.reemKufi(
                                      color: Color(0xff283618),
                                      fontSize:
                                      displayHeight(context) * 0.02) ,), height: displayHeight(context)*0.03,),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.black,
                                        )
                                      ),

                                      SizedBox(child: Text("Feb", style:GoogleFonts.reemKufi(
                                          color: Color(0xff283618),
                                          fontSize:
                                          displayHeight(context) * 0.02) ,), height: displayHeight(context)*0.03,)
                                ]),
                              )
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class SkinLogHistory extends StatefulWidget {
  const SkinLogHistory({Key? key}) : super(key: key);

  @override
  _SkinLogHistoryState createState() => _SkinLogHistoryState();
}

class _SkinLogHistoryState extends State<SkinLogHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(screenName: "Skin Log History"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayHeight(context) * 0.02),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDADBC6),
                          borderRadius:
                              BorderRadius.circular(20), //border corner radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextValue(
                                  text: "14 March", textSize: 20, bold: false),
                              Icon(Icons.tag_faces, color: Colors.black)
                            ],
                          ),
                        ));
                  }),
            ),
            Expanded(child: Text("Hello 1")),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
