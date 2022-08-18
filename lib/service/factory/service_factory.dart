import 'package:crypto_flutter_app/service/home/home_page_service.dart';

import '../../datamanagement/repository/factory/repository_factory.dart';

class ServiceFactory {
  late final RepositoryFactory _repositoryFactory;

  ServiceFactory._privateConstructor() {
    _repositoryFactory = RepositoryFactory();
  }

  HomePageService get homePageViewModel => HomePageService(_repositoryFactory.homePageRepository);

  static ServiceFactory _instance() => ServiceFactory._privateConstructor();

  factory ServiceFactory() {
    return _instance();
  }
}
