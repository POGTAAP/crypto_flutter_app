import 'package:crypto_flutter_app/models/main_data_model.dart';
import 'package:crypto_flutter_app/repository/crypto_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/coin_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<MainDataModel> _futureMainDataModel;
  late CryptoRepository cryptoRepository;

  @override
  void initState() {
    cryptoRepository = CryptoRepository();
    _futureMainDataModel = cryptoRepository.getCoinList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MainDataModel>(
      future: _futureMainDataModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var coinsData = snapshot.data!.dataModel;
            return CoinListWidget(coins: coinsData);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
