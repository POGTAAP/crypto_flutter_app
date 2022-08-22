import 'package:crypto_flutter_app/pages/details/coin_details_page_view_model.dart';
import 'package:crypto_flutter_app/pages/favourites/favourites_page_view_model.dart';
import 'package:crypto_flutter_app/pages/home/home_page_view_model.dart';

import '../service/factory/service_factory.dart';

class ViewModelFactory {
  static final ServiceFactory _serviceFactory = ServiceFactory();



  static get homePageViewModel => HomePageViewModel(_serviceFactory.homePageService);
  static get coinDetailsViewModel => CoinDetailsPageViewModel(_serviceFactory.coinDetailPageService);
  static get favouritesPageViewModel=>  FavouritesPageViewModel(_serviceFactory.favouritesPageService);
}
