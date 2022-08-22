import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_flutter_app/datamanagement/datastore/shared_preferences_util.dart';
import 'package:crypto_flutter_app/models/data_model.dart';


class SharedPreferencesUtilImpl extends SharedPreferencesUtil {
  final _coinsKey = "COINS";

  @override
  Future<void> addCoin(DataModel coin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final string =prefs.getString(_coinsKey);

    if (string != null) {
      final List<DataModel> coins = DataModel.decode(string);
      if(coins.where((element) => element.id == coin.id).isEmpty){
        coins.add(coin);
        prefs.setString(_coinsKey, json.encode(coins));
      }
    }else{
      List<DataModel> coins = [coin];
      prefs.setString(_coinsKey, json.encode(coins));
    }
  }

  @override
  Future<List<DataModel>?> getFavouriteCoins() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final string = prefs.getString(_coinsKey);

    if (string != null) {
      return DataModel.decode(string);
    } else {
      return null;
    }
  }

  @override
  Future<void> removeCoin(DataModel coin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final string =prefs.getString(_coinsKey);

    if (string != null) {
      final List<DataModel> coins = DataModel.decode(string);
      if(coins.where((element) => element.id == coin.id).isNotEmpty){
        coins.removeWhere((item) => item.id == coin.id);
        prefs.setString(_coinsKey, json.encode(coins));
      }
    }
  }
}
