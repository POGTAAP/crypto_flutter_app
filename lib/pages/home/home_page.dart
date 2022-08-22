import 'package:crypto_flutter_app/network/response/coin_list_response.dart';
import 'package:crypto_flutter_app/pages/favourites/favourites_page.dart';
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
      create: (context) => _viewModel.getCoinList(),
      initialData: null,
      catchError: (context, error) => null,
      child: Consumer<CoinListResponse?>(
        builder: (context, value, child) {
          if (value == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else {
            var coinsData = value.data;
            return Scaffold(
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 168,
                      child: DrawerHeader(
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/header.jpg"), fit: BoxFit.cover)),
                        child: Text(""),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: const Text('Favourite', style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavouritesPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              body: CoinListWidget(coins: coinsData),
            );
          }
        },
      ),
    );
  }
}
