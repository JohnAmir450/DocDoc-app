import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/features/login/data/repos/login_repo.dart';
import 'package:doctor_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctor_app/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/dio_factory.dart';

final getIt=GetIt.instance;

Future<void>setupGetIt()async{

  Dio dio=DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


    //login
   getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginCubit>(() =>LoginCubit(getIt()));



    getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
    getIt.registerFactory<SignUpCubit>(() =>SignUpCubit(getIt()));
}