import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LinearChat extends StatefulWidget {
  @override
  _LinearChatState createState() => _LinearChatState();
}

class _LinearChatState extends State<LinearChat> {
  List<Color> gradientColors = [
    Color(0xff161C19),
    Color(0xff274631),
    Color(0xff4D9760),
    Color(0xff4D9760),
    Color(0xff274631),
    Color(0xff161C19),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18.0,
                left: 12.0,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(mainData()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'History',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        )
      ],
    );
  }

  LineChartData mainData() {
    final double resevedSizeButtom = 12.0;
    final Map<int, String> numbersToMonth = {
      0: 'Nov',
      2: 'Dec',
      4: 'Jan',
      6: 'Feb',
      8: 'Mar',
      10: 'April',
    };

    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      lineTouchData: LineTouchData(
        enabled: true,
        getTouchedSpotIndicator: (lineChartBarData, list) {
          return [
            TouchedSpotIndicatorData(
              FlLine(color: Color(0xffA8B1AA), strokeWidth: 4),
              FlDotData(
                show: true,
                getDotPainter: (flSpot, numberDot, linearBar, value) {
                  return FlDotCirclePainter(
                    color: Color(0xff366542),
                    radius: 6,
                    strokeColor: Color(0xffC6C6C5),
                    strokeWidth: 8,
                  );
                },
              ),
            )
          ];
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.green,
          tooltipRoundedRadius: 8.0,
          getTooltipItems: (touchedSpots) {
            return [
              LineTooltipItem(
                '\$ 2,345',
                Theme.of(context).textTheme.subtitle2 ??
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              )
            ];
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: resevedSizeButtom,
          getTextStyles: (value) {
            return TextStyle(
              color: value.toInt() == 4 ? Colors.green : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            );
          },
          getTitles: (value) {
            return numbersToMonth[value.toInt()] ?? '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: -1,
      maxX: 11,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.8),
            FlSpot(0.8, 4),
            FlSpot(1.2, 5),
            FlSpot(1.6, 3.2),
            FlSpot(2.6, 4.2),
            FlSpot(3.3, 1.5),
            FlSpot(4, 7),
            FlSpot(5, 4),
            FlSpot(6.1, 5),
            FlSpot(7.1, 4),
            FlSpot(8.1, 5),
            FlSpot(9.1, 1.5),
            FlSpot(10, 3.8),
            FlSpot(11, 2.8),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
