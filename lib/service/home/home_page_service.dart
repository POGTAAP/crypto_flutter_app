import 'package:crypto_flutter_app/network/response/coin_list_response.dart';
import '../../datamanagement/home/home_page_repository.dart';
import '../base/base_service.dart';

class HomePageService extends BaseService {
  final HomePageRepository _repository;

  HomePageService(this._repository) : super(_repository);


  Future<CoinListResponse> getCoinList() {
    return _repository.getCoinList();
  }
}