
import 'package:crypto_flutter_app/models/coin_view_data.dart';
import 'package:crypto_flutter_app/pages/details/coin_details_page_view_model.dart';
import 'package:flutter/material.dart';
import '../../components/custom_app_bar_widget.dart';
import '../../components/coin_randomed_chart_widget.dart';
import '../../models/data_model.dart';
import '../../util/view_model_factory.dart';

class CoinDetailPage extends StatelessWidget {
  final CoinDetailsPageViewModel _viewModel = ViewModelFactory.coinDetailsViewModel;

  CoinDetailPage(DataModel coin, {Key? key}) : super(key: key) {
    _viewModel.setCoin(coin);
  }

  /// Sajnos a Basic api nem ad hozzáférést az eggyes coinok árfolyam adataihoz ezért random adatokkal töltöm fel!
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _getFavouriteButton(context),
                          ],
                        ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          data.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          data.value,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }

  _getFavouriteButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),primary: const Color.fromRGBO(0, 0, 0, 0.6),),
      onPressed: () {
        //TODO: mentés shared preferences-be
        _viewModel.saveCoinToFavourites();
      },
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.yellowAccent),
          Text(
            "Add to favourites",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
