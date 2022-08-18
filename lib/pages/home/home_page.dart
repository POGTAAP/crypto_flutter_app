import 'package:crypto_flutter_app/network/response/coin_list_response.dart';
import 'package:crypto_flutter_app/pages/home/home_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/coin_list_widget.dart';
import '../../util/view_model_factory.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageViewModel _viewModel = ViewModelFactory.homePageViewModel;

  late Future<CoinListResponse?> _futureMainDataModel;

  @override
  void initState() {
    _futureMainDataModel = _viewModel.getCoinList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CoinListResponse?>(
      future: _futureMainDataModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var coinsData = snapshot.data!.data;
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
