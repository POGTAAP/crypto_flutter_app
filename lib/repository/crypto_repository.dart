import 'package:crypto_flutter_app/models/main_data_model.dart';
import 'package:dio/dio.dart';

class CryptoRepository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  static String apiKey = "8d6654c4-4ff4-4b6f-96d6-41b392a67246";
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';
  final Dio _dio = Dio();

  Future<MainDataModel> getCoinList() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListingAPI);
      print(response.data);
      return MainDataModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Error: $error , Stacktrace:: $stacktrace");
      return MainDataModel.withError("Hiba az adatok beolvasása közbe!");
    }
  }
}
