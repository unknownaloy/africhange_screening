import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData extends StatelessWidget {
  const ChartData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      // margin: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 240.0,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 600,
          maxY: 6,
          titlesData: FlTitlesData(
            show: true,
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 22.0,
              getTextStyles: (_, __) =>
                  const TextStyle(color: Colors.black, fontSize: 16.0),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2:
                    return "MAR";
                  case 5:
                    return "JUN";
                  case 8:
                    return "SEP";
                }

                return "";
              },
              margin: 8.0,
            ),
          ),
          gridData: FlGridData(
            show: false,
            // getDrawingHorizontalLine: (value) {
            //   return FlLine(
            //     color: kGreyColor1,
            //     strokeWidth: 7.0,
            //   );
            // },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 280),
                const FlSpot(1, 100),
                const FlSpot(2, 80),
                const FlSpot(3, 120),
                const FlSpot(4, 350),
                const FlSpot(5, 500),
                const FlSpot(6, 600),
                const FlSpot(7, 550),
                const FlSpot(8, 200),
                const FlSpot(9, 450),
              ],
              isCurved: true,
              colors: [kGreyColor1, kGreyColor2],
              dotData: FlDotData(show: false),
              // gradientFrom: Offset(2, 10),
              // gradientTo: Offset(0.5, 1.0),
              barWidth: 1.0,
              belowBarData:
                  BarAreaData(show: true, colors: [kGreyColor1, kGreyColor2]),
            ),
          ],
        ),
      ),
    );
  }
}
