import 'package:crypto_flutter_app/network/response/coin_list_response.dart';
import 'package:flutter/material.dart';
import '../../components/coin_list_widget.dart';
import 'package:provider/provider.dart';

import '../../util/view_model_factory.dart';
import 'home_page_view_model.dart';

class HomePage extends StatelessWidget {

  final HomePageViewModel _viewModel = ViewModelFactory.homePageViewModel;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<CoinListResponse?>(
      create: (context) =>_viewModel.getCoinList(),
      initialData: null,
      catchError: (context,error) => null,
      child: Consumer<CoinListResponse?>(
        builder: (context, value, child) {
          if (value == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }else{
            var coinsData = value.data;
            return CoinListWidget(coins: coinsData);
          }
        },
      ),
    );
  }
}
