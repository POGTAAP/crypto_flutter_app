import 'package:crypto_flutter_app/network/header/prodplan_header_provider.dart';
import 'package:crypto_flutter_app/network/request/coin_list_request.dart';
import 'package:either_dart/either.dart';
import '../response/coin_list_response.dart';
import '../response/error_response.dart';
import 'api.dart';

class CryptoApi extends Api {
  @override
  Future<CryptoHeaderProvider>? headerProvider;

  CryptoApi({required this.headerProvider});

  Future<Either<ErrorResponse, CoinListResponse>> getCoinList(CoinListRequest request) async{
    final response = await get(request);
    final result = response.map((right) => CoinListResponse.fromJson(right));

    return result;
  }
}
