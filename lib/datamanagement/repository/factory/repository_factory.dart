

import 'package:crypto_flutter_app/datamanagement/home/home_page_repository.dart';
import 'package:crypto_flutter_app/network/api/prodplan_api.dart';
import 'package:crypto_flutter_app/network/api/prodplan_api_provider.dart';
import 'package:crypto_flutter_app/network/header/prodplan_header_provider.dart';

class RepositoryFactory {

  RepositoryFactory._privateConstructor();

  static RepositoryFactory _instance() => RepositoryFactory._privateConstructor();

  factory RepositoryFactory() {
    return _instance();
  }

  Future<CryptoHeaderProvider> get _header async {
    return CryptoHeaderProvider();
  }

  CryptoApi get _api => CryptoApiProvider(headerProvider: _header).prodplanApi;

  // Repositories
  get homePageRepository => HomePageRepository(_api);

}
