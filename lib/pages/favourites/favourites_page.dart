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
    return FutureProvider<List<DataModel>?>(
      create: (context) => _viewModel.coins,
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
            return Scaffold(
              body: _listView(value,context),
            );
          }
        },
      ),
    );
  }

  Widget _listView(List<DataModel> coins, BuildContext providerContext) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const CustomAppBar(title: "Kedvencek"),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: sliverSeparatedBuilder(
                      itemBuilder: (context, index) {
                        var coin = coins[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CoinDetailPage(coin)),
                              );
                            },
                            child: FavouriteItem(
                              coin: coin,
                              onItemTap: () => {
                                _viewModel.removeCoinFromFavourites(coin),
                              },
                              onRowTap: ()=>_navigateToDetails(coin, context),
                            ));
                      },
                      childCount: coins.length,
                      separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
