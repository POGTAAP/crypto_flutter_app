import 'package:crypto_flutter_app/pages/home/home_page_view_model.dart';

import '../service/factory/service_factory.dart';

class ViewModelFactory {
  static final ServiceFactory _serviceFactory = ServiceFactory();

  static get homePageViewModel => HomePageViewModel(_serviceFactory.homePageViewModel);
}
