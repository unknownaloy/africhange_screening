import 'package:africhange_screening/features/home/view_model/home_view_model.dart';
import 'package:africhange_screening/themes/colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartData extends StatelessWidget {
  const ChartData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, __) {
        List<FlSpot> toDisplay = [];

        for (int index = 0; index < model.historicPriceData.length; index++) {
          final flSpot = FlSpot(
            index.toDouble(),
            model.historicPriceData[index].toDouble(),
          );

          toDisplay.add(flSpot);
        }

        return Container(
          padding: const EdgeInsets.only(
            top: 32.0,
            left: 8.0,
            right: 8.0,
            bottom: 40.0,
          ),
          decoration: const BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Past 30 days",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const CircleAvatar(
                          radius: 4.0,
                          backgroundColor: kAccentColor,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text("Coming soon"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                      },
                      child: Text(
                        "Past 90 days",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: const Color(0xff4591E8),
                            ),
                      ),
                    ),
                    // #4591E8
                  ],
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),

              /// Chart data
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: 240.0,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: model.historicPriceData.length.toDouble(),
                    minY: 0,
                    maxY: 600,
                    borderData: FlBorderData(
                      border: const Border(
                        left: BorderSide(color: kGreyColor, width: .5),
                        bottom: BorderSide(color: kGreyColor, width: .5),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: SideTitles(showTitles: false),
                      rightTitles: SideTitles(showTitles: false),
                      leftTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22.0,
                        interval: 1,
                        getTextStyles: (_, __) => const TextStyle(
                          color: kWhiteColor,
                          fontSize: 12.0,
                        ),
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return "1st";
                            case 7:
                              return "7th";
                            case 15:
                              return "15th";
                            case 23:
                              return "23th";
                            case 30:
                              return "30th";
                          }

                          return "";
                        },
                        // margin: 8.0,
                      ),
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: toDisplay,
                        isCurved: true,
                        colors: [kGreyColor1, kGreyColor2],
                        dotData: FlDotData(show: false),
                        gradientFrom: const Offset(0, 0),
                        gradientTo: const Offset(0, 1),
                        barWidth: 1.0,
                        belowBarData: BarAreaData(
                            show: true, colors: [kGreyColor1, kGreyColor2]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 32.0,
              ),

              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text("Coming soon"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                },
                child: Text(
                  "Get rate alerts straight to your email box",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(color: kWhiteColor),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
