import 'package:crypto_flutter_app/datamanagement/repository/base/base_respository.dart';
import 'package:crypto_flutter_app/service/base/base_service.dart';
import 'package:crypto_flutter_app/service/home/home_page_service.dart';

import '../../datamanagement/repository/factory/repository_factory.dart';

class ServiceFactory {
  late final RepositoryFactory _repositoryFactory;

  ServiceFactory._privateConstructor() {
    _repositoryFactory = RepositoryFactory();
  }

  HomePageService get homePageService => HomePageService(_repositoryFactory.homePageRepository);
  BaseService get baseService => BaseService(_repositoryFactory.baseRepository);

  static ServiceFactory _instance() => ServiceFactory._privateConstructor();

  factory ServiceFactory() {
    return _instance();
  }
}
