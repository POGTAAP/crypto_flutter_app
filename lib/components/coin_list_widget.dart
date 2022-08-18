import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chart_data.dart';
import '../models/data_model.dart';
import 'coin_chart_widget.dart';
import 'coin_logo_widget.dart';

class CoinListWidget extends StatelessWidget {
  final List<DataModel> coins;

  const CoinListWidget({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  forceElevated: true,
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset('assets/images/header.jpg',fit: BoxFit.cover),
                    title: Text('Coin list'),
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: sliverSeparatedBuilder(
                    itemBuilder: (context, index) {
                      var coin = coins[index];
                      var coinPrice = coin.quoteModel.usdModel;
                      var data = [
                        ChartData(coinPrice.percentChange_90d, 2160),
                        ChartData(coinPrice.percentChange_60d, 1440),
                        ChartData(coinPrice.percentChange_30d, 720),
                        ChartData(coinPrice.percentChange_24h, 24),
                        ChartData(coinPrice.percentChange_1h, 1),
                      ];
                      return GestureDetector(
                        onTap: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CoinDetailScreen(coin: coin)),
                          );*/
                        },
                        child: Container(
                          height: 120.0,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric( horizontal: 16.0,vertical: 8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CoinLogoWidget(coin: coin),
                              CoinChartWidget(
                                data: data,
                                coinPrice: coinPrice,
                                color: Colors.grey,
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
              ],
            ),
          ),
        ],
      ),
    );
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
