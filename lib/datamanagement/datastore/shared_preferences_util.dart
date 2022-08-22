
import '../../models/data_model.dart';

abstract class SharedPreferencesUtil {
  void addCoin(DataModel coin);
  Future<List<DataModel>?> getFavouriteCoins();
  void removeCoin(DataModel coin);
}