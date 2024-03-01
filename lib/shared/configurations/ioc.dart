import 'package:get_it/get_it.dart';
import 'package:rq_soap/shared/contracts/storage.dart';
import 'package:rq_soap/shared/contracts/validator.dart';
import 'package:rq_soap/shared/contracts/web_client.dart';
import 'package:rq_soap/shared/services/storage.dart';
import 'package:rq_soap/shared/services/validator.dart';
import 'package:rq_soap/shared/services/web_client.dart';

GetIt ioc = GetIt.instance;

class Ioc {
  static setupIocDependency() {
    ioc.registerLazySingleton<IStorageService>(() => StorageService());
    ioc.registerLazySingleton<IWebClient>(() => WebClient());
    ioc.registerLazySingleton<IValidatorService>(() => ValidatorService());
  }

  static T get<T extends Object>() {
    return ioc<T>();
  }
}