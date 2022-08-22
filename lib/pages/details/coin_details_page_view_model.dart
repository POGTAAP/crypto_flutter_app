import 'dart:math';
import 'package:crypto_flutter_app/models/data_model.dart';
import 'package:crypto_flutter_app/service/coin/coin_details_page_service.dart';
import 'package:crypto_flutter_app/util/date_helper.dart';
import '../../base/base_view_model.dart';
import '../../models/chart_data.dart';
import '../../models/coin_view_data.dart';

class CoinDetailsPageViewModel extends BaseViewModel {
  late DataModel _coin;
  final CoinDetailsPageService _service;

  CoinDetailsPageViewModel(this._service) : super(_service);

  void setCoin(DataModel coin) {
    _coin = coin;
  }

  String getCoinDate() {
    return DateHelper().getDateStringFromServerDateFormat(_coin.quoteModel.priceModel.lastUpdated, DateStringFormat.fullDateTime);
  }

  DataModel getCoin() {
    return _coin;
  }

  String getTitle() {
    return _coin.name + " (" + _coin.symbol + ")";
  }

  List<CoinViewData> getCoinViewDataList() {
    List<CoinViewData> returnValueList = [];
    returnValueList.add(CoinViewData("Market pairs:", _coin.numMarketPairs.toString()));
    if(_coin.dateAdded.isNotEmpty){
      returnValueList.add(CoinViewData("Date added:", DateHelper().getDateStringFromServerDateFormat(_coin.dateAdded, DateStringFormat.onlyDate)));
    }
    returnValueList.add(CoinViewData("Circulating Supply", _coin.circulatingSupply.toString()));
    if(_coin.maxSupply!=null){
      returnValueList.add(CoinViewData("Max Supply", _coin.maxSupply.toString()));
    }
    returnValueList.add(CoinViewData("Market Cap:", _coin.quoteModel.priceModel.marketCap.toString()));
    return returnValueList;
  }

  getCoinChartData() {
    var coinPrice = _coin.quoteModel.priceModel;
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);
    return [
      ChartData(next(110, 140), 1),
      ChartData(next(9, 41), 2),
      ChartData(next(130, 190), 3),
      ChartData(coinPrice.percentChange_24h, 4),
      ChartData(coinPrice.percentChange_1h, 5),
      ChartData(next(110, 140), 6),
      ChartData(next(9, 41), 7),
      ChartData(next(140, 200), 8),
      ChartData(coinPrice.percentChange_24h, 9),
      ChartData(coinPrice.percentChange_1h, 10),
      ChartData(next(110, 140), 12),
      ChartData(next(9, 41), 13),
      ChartData(coinPrice.percentChange_1h, 14),
      ChartData(next(9, 41), 15),
      ChartData(next(140, 200), 16),
    ];
  }

  void saveCoinToFavourites() {
    _service.saveCoinToFavourites(_coin);
  }
}

