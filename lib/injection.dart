import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_app/data/repository/deliveryRepo.dart';
import 'package:islamic_app/data/repository/store_keeper_repo.dart';
import 'package:islamic_app/data/repository/supevisorRepo.dart';
import 'package:islamic_app/presentation/auth/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'core/network_info.dart';
import 'data/app_urls/app_url.dart';
import 'data/datasource/locale/locale_data_source.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/SaveUserData.dart';
import 'data/repository/Setting_Repo.dart';
import 'data/repository/auth_repo.dart';
import 'data/repository/directorRepo.dart';
import 'data/repository/home_Repo.dart';
import 'data/repository/myOrderRepo.dart';
import 'data/repository/quality_specialist_repo.dart';
import 'data/repository/site_supervisorRepo.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(),
      loggingInterceptor: getIt(), sharedPreferences: getIt()));

  /// Providers
  getIt.registerLazySingleton(() => AuthViewModel(saveUserData: getIt(), authRepo: getIt()));
  // getIt.registerLazySingleton(() => StoreKeeperViewModel(saveUserData: getIt(), storeKeeperRepo: getIt()));
  // getIt.registerLazySingleton(() => SiteSupervisorViewModel(saveUserData: getIt(), siteSupervisorRepo: getIt()));
  // getIt.registerLazySingleton(() => DeliveryViewModel(saveUserData: getIt(), deliveryRepo: getIt()));
  // getIt.registerLazySingleton(() => SuperVisorViewModel(saveUserData: getIt(), superVisorRepo: getIt()));
  // getIt.registerLazySingleton(() => DirectorViewModel(saveUserData: getIt(), directorRepo: getIt()));
  // getIt.registerLazySingleton(() => QualitySpecialistViewModel(saveUserData: getIt(), qualitySpecialistRepo: getIt()));

  getIt.registerLazySingleton(() => ProductProvider());

  /// Repository
  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), dioClient: getIt()));
  getIt.registerLazySingleton(() => AuthRepo(dioClient: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton(() => StoreKeeperRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => HomeRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => DeliveryRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => DirectorRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => SettingRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => MyOrdersRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => SuperVisorRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => QualitySpecialistRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => SiteSupervisorRepo(dioClient: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  // getIt.registerLazySingleton(() => UserModel());
  getIt.registerLazySingleton(() => Connectivity());
}
