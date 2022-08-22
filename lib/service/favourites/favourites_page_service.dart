import 'package:crypto_flutter_app/datamanagement/repository/coin/coin_repository.dart';
import '../../models/data_model.dart';
import '../base/base_service.dart';

class FavouritesPageService extends BaseService {
  final CoinRepository _repository;

  FavouritesPageService(this._repository) : super(_repository);

  Future<List<DataModel>?> getFavouriteCoins() {
    return _repository.getFavouriteCoins();
  }

  void removeCoinFromFavourites(DataModel coin) {
    _repository.removeCoinFromFavourites(coin);
  }

}