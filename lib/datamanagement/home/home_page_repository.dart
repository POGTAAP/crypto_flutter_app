import 'package:crypto_flutter_app/network/request/coin_list_request.dart';
import 'package:crypto_flutter_app/network/response/coin_list_response.dart';
import 'package:crypto_flutter_app/network/response/error_response.dart';
import 'package:either_dart/src/either.dart';

import '../repository/base/base_respository.dart';

class HomePageRepository extends BaseRepository {
  const HomePageRepository(api) : super(api);

  Future<Either<ErrorResponse, CoinListResponse>> getCoinList()async {
    return await api.getCoinList(CoinListRequest());
  }
}