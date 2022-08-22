import 'package:crypto_flutter_app/network/api/crypto_api.dart';
import '../../datastore/shared_preferences_util.dart';

class BaseRepository {
  final CryptoApi api;
  final SharedPreferencesUtil sharedPreferences;

  const BaseRepository(this.api, this.sharedPreferences);

}
