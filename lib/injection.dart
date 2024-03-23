import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:islamic_app/data/repository/tools_Repo.dart';
import 'package:islamic_app/presentation/auth/auth_view_model.dart';
import 'package:islamic_app/presentation/my_habits_screen/my_habits_screen_view_model.dart';
import 'package:islamic_app/presentation/register_screen/register_screen_view_model.dart';
import 'package:islamic_app/presentation/tools_screen/pages/quraan/my_provider_quraan.dart';
import 'package:islamic_app/presentation/tools_screen/tools_view_model.dart';
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
import 'data/repository/home_Repo.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(),
      loggingInterceptor: getIt(), sharedPreferences: getIt()));

  /// Providers
  getIt.registerLazySingleton(() => AuthViewModel(saveUserData: getIt(), authRepo: getIt()));
  getIt.registerLazySingleton(() => ToolsViewModel(saveUserData: getIt(), toolsRepo: getIt()));
  getIt.registerLazySingleton(() => RegisterScreenViewModel(saveUserData: getIt(), homeRepo: getIt()));
  getIt.registerLazySingleton(() => HabitsScreenViewModel(saveUserData: getIt(), homeRepo: getIt()));
  getIt.registerLazySingleton(() => MyProviderQuraan());

  // getIt.registerLazySingleton(() => ProductProvider());

  /// Repository
  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), dioClient: getIt()));
  getIt.registerLazySingleton(() => AuthRepo(dioClient: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton(() => HomeRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => ToolsRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => SettingRepo(dioClient: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  // getIt.registerLazySingleton(() => UserModel());
  getIt.registerLazySingleton(() => Connectivity());
}
