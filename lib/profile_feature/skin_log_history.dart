import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../main.dart';
import '../utilities/utility.dart';

class SkinLogHistory extends StatefulWidget {
  const SkinLogHistory({Key? key}) : super(key: key);

  @override
  _SkinLogHistoryState createState() => _SkinLogHistoryState();
}

class _SkinLogHistoryState extends State<SkinLogHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
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

