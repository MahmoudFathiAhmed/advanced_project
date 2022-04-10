import 'package:advanced_project/app/app_prefs.dart';
import 'package:advanced_project/data/data_source/remote_data_source.dart';
import 'package:advanced_project/data/network/app_api.dart';
import 'package:advanced_project/data/network/dio_factory.dart';
import 'package:advanced_project/data/network/network_info.dart';
import 'package:advanced_project/data/repository/repository_impl.dart';
import 'package:advanced_project/domain/repository/repository.dart';
import 'package:advanced_project/domain/usecase/forgot_password_usecase.dart';
import 'package:advanced_project/domain/usecase/login_usecase.dart';
import 'package:advanced_project/presentation/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:advanced_project/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{
  //app module, it's a module where we put all generic dependencies

  //shared prefs instances
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()
          ));
  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory> ().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance()));
  
  //repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));
}



initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule(){
  if(!GetIt.I.isRegistered<ForgotPasswordUseCase>()){
    instance.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel(instance()));
    
  }
}