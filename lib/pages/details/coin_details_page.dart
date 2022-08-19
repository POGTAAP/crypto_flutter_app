import 'dart:math';
import 'package:crypto_flutter_app/models/coin_view_data.dart';
import 'package:crypto_flutter_app/pages/details/coin_details_view_model.dart';
import 'package:flutter/material.dart';

import '../../components/custom_app_bar_widget.dart';
import '../../components/coin_randomed_chart_widget.dart';
import '../../models/chart_data.dart';
import '../../models/data_model.dart';
import '../../util/view_model_factory.dart';

class CoinDetailScreen extends StatelessWidget {
  final CoinDetailsViewModel _viewModel = ViewModelFactory.coinDetailsViewModel;

  CoinDetailScreen(DataModel coin, {Key? key}) : super(key: key) {
    _viewModel.setCoin(coin);
  }

  /// sajnos a Basic api nem ad hozzáférést az eggyes coinok árfolyam adataihoz ezért random adatokkal töltöm fel!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(title: _viewModel.getTitle()),
          CoinRandomedChartWidget(coinPrice: _viewModel.getCoin().quoteModel.priceModel, outputDate: _viewModel.getCoinDate(), data: _viewModel.getCoinChartData()),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  child: Column(
                    children: [
                      for (var itemData in _viewModel.getCoinViewDataList())
                        Container(
                          child: _getRow(context, itemData),
                        ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getRow(context, CoinViewData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          data.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Flexible(
          child: Container(),
        ),
        Text(
          data.value,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
