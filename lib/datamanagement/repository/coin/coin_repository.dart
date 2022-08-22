import '../../../models/data_model.dart';
import '../base/base_respository.dart';

class CoinRepository extends BaseRepository {
  const CoinRepository(api, sharedPreferences) : super(api, sharedPreferences);

  void saveCoinToFavourites(coin) {
    sharedPreferences.addCoin(coin);
  }

  Future<List<DataModel>?> getFavouriteCoins() async {
    return sharedPreferences.getFavouriteCoins();
  }

  void removeCoinFromFavourites(DataModel coin) {
    sharedPreferences.removeCoin(coin);
  }
}