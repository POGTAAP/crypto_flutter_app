import 'package:http/http.dart' as http;
import '../request/network_request.dart';
import '../header/prodplan_header_provider.dart';

abstract class Api {
  abstract Future<CryptoHeaderProvider>? headerProvider;
  final String _baseUrl = "https://pro-api.coinmarketcap.com/v1/";
  final int _timeoutDurationTimeInSeconds = 20;

  Future <dynamic> get(NetworkRequest request) async {
    final header = await headerProvider;
    final response = await http.get(Uri.parse(_baseUrl + request.endpoint), headers: header?.getHeaders()).timeout(Duration(seconds: _timeoutDurationTimeInSeconds));
    return response;
  }
}
