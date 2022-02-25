
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/api/user_details_remote.dart';
import 'core/utils/constants.dart';
import 'features/Screen/MyAccount/api/notifications_remote.dart';
import 'features/Screen/add_address/api/city_remote.dart';
import 'features/Screen/add_address/api/section_remote.dart';
import 'features/Screen/bank_transfer/api/carts_remote.dart';
import 'features/Screen/bank_transfer/api/mybank_remote.dart';
import 'features/Screen/bank_transfer/bloc/MyBankBloc.dart';
import 'features/Screen/category/api/category_remote.dart';
import 'features/Screen/home/api/product_remote.dart';
import 'features/Screen/home/api/slider_remote.dart';
import 'features/Screen/loginScreen/api/log_in_remote.dart';
import 'features/Screen/loginScreen/bloc/LoginBloc.dart';
import 'features/Screen/orders/api/oders_remote.dart';
import 'features/Screen/pages/bloc/PagesBloc.dart';
import 'features/Screen/register/api/register_remote.dart';
import 'features/Screen/register/bloc/RegisterBloc.dart';
import 'features/Screen/splash/api/settings_remote.dart';
import 'features/Screen/splash/bloc/SettingsBloc.dart';



final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //! External


  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 12000,
          receiveTimeout: 12000,
          sendTimeout: 12000,
          baseUrl: Endpoints.BASE_URL,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );

      return dio;
    },
  );

  sl.registerLazySingleton(() => DataConnectionChecker());


  //datasource
  sl.registerLazySingleton<LogInRemoteDataSource>(
    () => LogInRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<UserDetailsRemoteDataSource>(
        () => UserDetailsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<SliderRemoteDataSource>(
        () => SliderRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<CategoryRemoteDataSource>(
        () => CategoryRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MyBankRemoteDataSource>(
        () => MyBankRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<CityRemoteDataSource>(
        () => CityRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<SectionRemoteDataSource>(
        () => SectionRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<NotificationRemoteDataSource>(
        () => NotificationRemoteDataSourceImpl(dio: sl(), networkInfo: sl()
        ),
  );

  sl.registerLazySingleton<SettingsRemoteDataSource>(
        () => SettingsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()
    ),
  );

  sl.registerLazySingleton<CartsRemoteDataSource>(
        () => CartsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<OrdersRemoteDataSource>(
        () => OrdersRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );


  // Bloc
  sl.registerLazySingleton(() => LoginBloc(logInRemoteDataSource: sl()));

  sl.registerLazySingleton(() => SettingsBloc(settingsRemoteDataSource: sl()));

  sl.registerLazySingleton(() => RegisterBloc( registerRemoteDataSource: sl()));

  sl.registerLazySingleton(() => MyBankBloc( myBankRemoteDataSource: sl(),
         cityRemoteDataSource: sl(),
    sectionRemoteDataSource: sl(),
    cartsRemoteDataSource: sl()
  ));

  sl.registerLazySingleton(() => PagesBloc(
      userDetailsRemoteDataSource: sl(),
  sliderRemoteDataSource: sl(),
    productRemoteDataSource: sl(),
    categoryRemoteDataSource: sl(),
    notificationRemoteDataSource: sl(),
    ordersRemoteDataSource: sl()
  ));



}
