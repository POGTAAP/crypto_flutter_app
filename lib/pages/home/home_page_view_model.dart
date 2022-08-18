import 'package:crypto_flutter_app/models/main_data_model.dart';
import 'package:crypto_flutter_app/network/response/coin_list_response.dart';

import '../../base/base_view_model.dart';
import '../../service/home/home_page_service.dart';

class HomePageViewModel extends BaseViewModel {
  final HomePageService _service;
  CoinListResponse? _response;

  CoinListResponse? get response => _response;

  HomePageViewModel(this._service) : super(_service);

  Future<CoinListResponse?> getCoinList() async {
    reset();
    await load(() {
      return _service.getCoinList();
    }, (response) {
      return _response = response;
    }, (error) {
      this.error = error as Exception?;
      closeLoadingAndNotifyPage();
    });
    return null;
  }

  void reset() {
    _response = null;
    error = null;
    isLoading = false;
    notifyListeners();
  }
}