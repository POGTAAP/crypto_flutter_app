import 'package:crypto_flutter_app/models/data_model.dart';
import '../../base/base_view_model.dart';
import '../../service/favourites/favourites_page_service.dart';

class FavouritesPageViewModel extends BaseViewModel {
  final FavouritesPageService _service;
  Future<List<DataModel>?> get coins => _service.getFavouriteCoins();

  FavouritesPageViewModel(this._service) : super(_service);

  Future<List<DataModel>?> getFavouriteCoins() async{
    return coins;
  }

  removeCoinFromFavourites(DataModel coin) {
    _service.removeCoinFromFavourites(coin);
    notifyListeners();
  }
}
