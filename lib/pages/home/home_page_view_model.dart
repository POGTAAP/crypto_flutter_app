import 'package:crypto_flutter_app/network/response/coin_list_response.dart';
import '../../base/base_view_model.dart';
import '../../service/home/home_page_service.dart';

class HomePageViewModel extends BaseViewModel {
  final HomePageService _service;
  CoinListResponse? _response;

  CoinListResponse? get response => _response;

  HomePageViewModel(this._service) : super(_service);

  Future<CoinListResponse?> getCoinList() async {
    return _service.getCoinList();
  }
}
