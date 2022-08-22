import 'package:crypto_flutter_app/datamanagement/home/home_page_repository.dart';
import 'package:crypto_flutter_app/datamanagement/repository/base/base_respository.dart';
import 'package:crypto_flutter_app/datamanagement/repository/coin/coin_repository.dart';
import 'package:crypto_flutter_app/network/api/crypto_api.dart';
import 'package:crypto_flutter_app/network/api/crypto_api_provider.dart';
import 'package:crypto_flutter_app/network/header/prodplan_header_provider.dart';

import '../../datastore/shared_preferences_util_impl.dart';

class RepositoryFactory {
  RepositoryFactory._privateConstructor();

  static RepositoryFactory _instance() => RepositoryFactory._privateConstructor();
  final sharedPreferences = SharedPreferencesUtilImpl();

  factory RepositoryFactory() {
    return _instance();
  }

  Future<CryptoHeaderProvider> get _header async {
    return CryptoHeaderProvider();
  }

  CryptoApi get _api => CryptoApiProvider(headerProvider: _header).prodplanApi;

  // Repositories
  get homePageRepository => HomePageRepository(_api, sharedPreferences);

  get baseRepository => BaseRepository(_api, sharedPreferences);

  get coinRepository => CoinRepository(_api, sharedPreferences);
}
