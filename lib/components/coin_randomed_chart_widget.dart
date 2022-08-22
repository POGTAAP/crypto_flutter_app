import 'package:crypto_flutter_app/components/sliver_widget.dart';
import 'package:crypto_flutter_app/models/price_model.dart';
import 'package:flutter/material.dart';

import '../models/chart_data.dart';
import 'coin_chart_widget.dart';

class CoinRandomedChartWidget extends StatefulWidget {
  const CoinRandomedChartWidget({
    Key? key,
    required this.coinPrice,
    required this.outputDate,
    required this.data,
  }) : super(key: key);

  final PriceModel coinPrice;
  final String outputDate;
  final List<ChartData> data;

  @override
  _CoinRandomedChartWidgetState createState() => _CoinRandomedChartWidgetState();
}

class _CoinRandomedChartWidgetState extends State<CoinRandomedChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 360.0,
        maxHeight: 360.0,
        child: Column(
          children: [
            Text(
              '\$' + widget.coinPrice.price.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              widget.outputDate,
              style: const TextStyle(
                color: Colors.yellowAccent,
              ),
            ),
            CoinChartWidget(coinPrice: widget.coinPrice, color: Colors.green, data: widget.data),
            const SizedBox(height: 8.0)
          ],
        ),
      ),
    );
  }
}
