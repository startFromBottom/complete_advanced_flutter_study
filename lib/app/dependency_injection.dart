import 'package:complete_advanced_flutter/app/app_prefs.dart';
import 'package:complete_advanced_flutter/data/data_source/remote_data_source.dart';
import 'package:complete_advanced_flutter/data/network/app_api.dart';
import 'package:complete_advanced_flutter/data/network/dio_factory.dart';
import 'package:complete_advanced_flutter/data/network/network_info.dart';
import 'package:complete_advanced_flutter/data/repository/repository_implementer.dart';
import 'package:complete_advanced_flutter/domain/repository/repository.dart';
import 'package:complete_advanced_flutter/domain/usecase/login_usecase.dart';
import 'package:complete_advanced_flutter/presentation/login/login_viewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  // DioFactory는 등록했지만, Dio를 등록하지 않았기 때문에 dio 변수를 따로 선언해서 넣어 준다.
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // registerSingleton과 달리, 호출될 때마다 새로운 객체를 리턴.
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
