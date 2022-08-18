import 'package:crypto_flutter_app/network/api/prodplan_api.dart';
import '../header/prodplan_header_provider.dart';

class CryptoApiProvider {
  late final CryptoApi prodplanApi;

  CryptoApiProvider({required Future<CryptoHeaderProvider> headerProvider}) {
      prodplanApi = CryptoApi(headerProvider: headerProvider);
  }
}
