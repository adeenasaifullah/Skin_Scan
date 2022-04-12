import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editProfile.dart';
import 'package:skin_scan/screenSizes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'MyBottomAppBar.dart';
import 'categoriesAndSearch.dart';
import 'main.dart';
import 'package:fl_chart/fl_chart.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFFFDF4),
        centerTitle: false,
        title: Text("My Profile",
            style: GoogleFonts.reemKufi(
                color: Color(0xFF4D4D4D),
                fontSize: displayHeight(context) * 0.04)),
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
                      ReemKufi_Green_Bold(textValue: "Afzal     ", size: displayHeight(context) * 0.05),
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
      //bottomNavigationBar: BottomBar(),
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
                                title: ReemKufiOffwhite(textValue: 'Are you sure you want to unfavourite this product?',size: displayHeight(context) * 0.04),
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
                  ReemKufi_Green(textValue: widget.productName, size: displayHeight(context) * 0.025),
                  SizedBox(height: displayHeight(context) * 0.005),
                  Rating(
                    productRating: widget.productRating,
                  ),
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
  List products =["Product A","Product B","Product C","Product D","Product E","Product F","Product G","Product H",];
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
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetail(productPrice: 2000, productImage: 'assets/Favourite.png', productName: products[index],)));
                    },
                      child: Container(
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
                                ReemKufi_Green(textValue: products[index], size: displayHeight(context)*0.0225),
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
                                    SizedBox(
                                      child: ReemKufi_Green(textValue: "14", size: displayHeight(context) * 0.0225),
                                      height: displayHeight(context)*0.03,),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          )
                                        ),
                                        SizedBox(child: ReemKufi_Green(textValue: "Feb", size: displayHeight(context) * 0.02),
                                          height: displayHeight(context)*0.03,)
                                  ]),
                                )
                              ],
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
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
                  itemCount: 8,
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
                              ReemKufi_Green(textValue: "14 March", size: displayHeight(context)*0.025),
                              Icon(Icons.tag_faces, color: Colors.black)
                            ],
                          ),
                        ));
                  }),
            ),
            SizedBox(
              height: displayHeight(context) * 0.05,
            ),
            Container(
                   height: displayHeight(context) * 0.3,
                   child: _LineChart()),
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart();


  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }


  LineChartData get sampleData2 => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
  );


  LineTouchData get lineTouchData2 => LineTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_3,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Bad';
        break;
      case 3:
        text = 'Normal';
        break;
      case 5:
        text = 'Good';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 60,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Day 1', style: style);
        break;
      case 4:
        text = const Text('Day 2', style: style);
        break;
      case 7:
        text = const Text('Day 3', style: style);
        break;
      case 10:
        text = const Text('Day 4', style: style);
        break;
      case 13:
        text = const Text('Day 5', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 10.0));
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Color(0xff4e4965), width: 2),
      left: BorderSide(color: Color(0xff4e4965), width: 2),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: const Color(0xff283618),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(show: true),
    aboveBarData: BarAreaData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 3),
      FlSpot(4, 1),
      FlSpot(7, 5),
      FlSpot(10, 1),
      FlSpot(13, 5),
    ],
  );
}

