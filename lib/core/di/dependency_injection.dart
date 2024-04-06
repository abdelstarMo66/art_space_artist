import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/core/network/dio_factory.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/repo/forget_password_repo.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/login/data/repo/Login_repository.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/register/data/repo/register_repo.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/products/data/repo/repo.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/profile/data/repo/get_profile_repo.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/get_profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Auth
  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  //Register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
  //Forget Password And Reset it
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt.registerLazySingleton<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt()));
  //Get profile
  getIt.registerLazySingleton<GetProfileRepo>(() => GetProfileRepo(getIt()));
  getIt.registerLazySingleton<GetProfileCubit>(() => GetProfileCubit(getIt()));
  // Products
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));
}
