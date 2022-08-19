import 'package:crypto_flutter_app/models/price_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_data.dart';

class CoinChartWidget extends StatelessWidget {
  const CoinChartWidget({
    Key? key,
    required this.data,
    required this.coinPrice,
    required this.color,
  }) : super(key: key);

  final List<ChartData> data;
  final PriceModel coinPrice;
  final Color color;

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 160.0,
              width: double.infinity,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(isVisible: true, borderColor: Colors.white),
                primaryYAxis: CategoryAxis(isVisible: true),
                legend: Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: false),
                series: <ChartSeries<ChartData, String>>[
                  LineSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (ChartData chartData, _) => chartData.year.toString(),
                    yValueMapper: (ChartData chartData, _) => chartData.value,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.only(right: 16.0),
            alignment: Alignment.center,
            width: 72,
            height: 36,
            decoration: BoxDecoration(color: coinPrice.percentChange_7d >= 0 ? Colors.green : Colors.red, borderRadius: BorderRadius.circular(16.0)),
            child: Text(
              coinPrice.percentChange_7d.toStringAsFixed(2) + "%",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: textStyle.bodyText1?.fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
