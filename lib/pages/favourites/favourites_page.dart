import 'package:crypto_flutter_app/components/favourite_item.dart';
import 'package:flutter/material.dart';
import '../../components/coin_list_widget.dart';
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
    return ChangeNotifierProvider<FavouritesPageViewModel>(
      create: (context) => _viewModel..getFavouriteCoins(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<FavouritesPageViewModel>(
                builder: (context, model, child) {
                  if (model.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return CustomScrollView(
                      slivers: [
                        const CustomAppBar(title: "Favourites"),
                        model.coins.isEmpty
                            ? SliverToBoxAdapter(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Your favourites list is empty", style: Theme.of(context).textTheme.bodyText1),
                                  ),
                                ],
                              ))
                            : SliverPadding(
                                padding: const EdgeInsets.all(16.0),
                                sliver: _listView(model.coins, context),
                              ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView(List<DataModel> coins, BuildContext providerContext) => SliverList(
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
                onRowTap: () => _navigateToDetails(coin, context),
              ),
            );
          },
          childCount: coins.length,
          separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
        ),
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
