import 'package:crypto_flutter_app/models/data_model.dart';
import '../../base/base_view_model.dart';
import '../../service/favourites/favourites_page_service.dart';

class FavouritesPageViewModel extends BaseViewModel {
  final FavouritesPageService _service;
  List<DataModel> _coins = [];
  List<DataModel> get coins => _coins;


  FavouritesPageViewModel(this._service) : super(_service) {
    getFavouriteCoins();
    notifyListeners();
  }

  Future<List<DataModel>> getFavouriteCoins() async {
    _coins = (await _service.getFavouriteCoins())!;
    closeLoadingAndNotifyPage();
    return _coins;
  }

  removeCoinFromFavourites(DataModel coin) {
    _service.removeCoinFromFavourites(coin);
    getFavouriteCoins();
  }
}
