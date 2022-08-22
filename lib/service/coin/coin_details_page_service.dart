import 'package:crypto_flutter_app/datamanagement/repository/coin/coin_repository.dart';
import 'package:crypto_flutter_app/models/data_model.dart';

import '../base/base_service.dart';

class CoinDetailsPageService extends BaseService {
  final CoinRepository _repository;

  CoinDetailsPageService(this._repository) : super(_repository);


  void saveCoinToFavourites(coin) {
    return _repository.saveCoinToFavourites(coin);
  }

  Future<List<DataModel>?> getFavouriteCoins() {
    return _repository.getFavouriteCoins();
  }
}