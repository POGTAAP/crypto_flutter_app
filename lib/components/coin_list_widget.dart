import 'package:crypto_flutter_app/models/price_model.dart';
import 'package:flutter/material.dart';

import '../models/chart_data.dart';
import '../models/data_model.dart';
import '../pages/details/coin_details_page.dart';
import 'coin_chart_widget.dart';
import 'coin_logo_widget.dart';
import 'custom_app_bar_widget.dart';

class CoinListWidget extends StatelessWidget {
  final List<DataModel> coins;

  const CoinListWidget({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              const CustomAppBar(title: "Coin list"),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                sliver: SliverList(
                  delegate: sliverSeparatedBuilder(
                    itemBuilder: (context, index) {
                      var coin = coins[index];
                      var coinPrice = coin.quoteModel.priceModel;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CoinDetailPage(coin)),
                          );
                        },
                        child: Container(
                          height: 120.0,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 0.6),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CoinLogoWidget(coin: coin),
                              CoinChartWidget(
                                data: _getChartData(coinPrice),
                                coinPrice: coinPrice,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: coins.length,
                    separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getChartData(PriceModel coinPrice) {
    return [
      ChartData(coinPrice.percentChange_1h, 1),
      ChartData(coinPrice.percentChange_24h, 2),
      ChartData(coinPrice.percentChange_30d, 3),
      ChartData(coinPrice.percentChange_60d, 4),
      ChartData(coinPrice.percentChange_90d, 5),
    ];
  }
}

SliverChildDelegate sliverSeparatedBuilder({required IndexedWidgetBuilder itemBuilder, required IndexedWidgetBuilder separatorBuilder, required int childCount}) {
  return SliverChildBuilderDelegate(
    (context, index) {
      var positionalIndex = index ~/ 2;
      if (index.isEven) {
        return itemBuilder(context, positionalIndex);
      } else {
        return separatorBuilder(context, positionalIndex);
      }
    },
    childCount: childCount * 2 - 1,
  );
}
