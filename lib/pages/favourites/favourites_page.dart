import 'package:crypto_flutter_app/components/favourite_item.dart';
import 'package:crypto_flutter_app/models/price_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/coin_list_widget.dart';
import '../../components/coin_logo_widget.dart';
import '../../components/custom_app_bar_widget.dart';
import '../../models/data_model.dart';
import '../../util/view_model_factory.dart';
import 'package:provider/provider.dart';

import '../details/coin_details_page.dart';
import 'favourites_page_view_model.dart';

class FavouritesPage extends StatelessWidget {
  final FavouritesPageViewModel _viewModel = ViewModelFactory.favouritesPageViewModel;

  FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(title: "Kedvencek"),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FutureProvider<List<DataModel>?>(
                  create: (context) => _viewModel.getFavouriteCoins(),
                  initialData: null,
                  catchError: (context, error) => null,
                  child: Consumer<List<DataModel>?>(
                    builder: (context, value, child) {
                      if (value == null) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        var coinsData = value;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _listView(coinsData),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listView(List<DataModel> coinsData) => ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          var coin = coinsData[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: FavoriteItem(
                  coin: coin,
                  onTap: () =>  _viewModel.removeCoinFromFavourites(coin),
                ),
                onTap: () => _navigateToDetails(coin, context),
              )
            ],
          );
        },
        itemCount: coinsData.length,
      );

  void _navigateToDetails(DataModel coin, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoinDetailPage(coin),
      ),
    );
  }
}
