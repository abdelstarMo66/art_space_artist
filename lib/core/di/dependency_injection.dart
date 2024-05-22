import 'package:art_space_artist/core/network/api_service.dart';
import 'package:art_space_artist/core/network/dio_factory.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/repo/forget_password_repo.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/login/data/repo/Login_repository.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/register/data/repo/register_repo.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/home/data/repositories/home_repository.dart';
import 'package:art_space_artist/features/products/data/repo/repo.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/profile/data/repo/profile_repo.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auction/data/repo/repo.dart';
import '../../features/auction/presentation/view_model/auction_cubit.dart';
import '../../features/events/data/repo/repo.dart';
import '../../features/events/presentation/view_model/event_cubit.dart';
import '../../features/home/presentation/view_model/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Auth
  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //Register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  //Forget Password And Reset it
  getIt.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(getIt()));
  getIt.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  // Home Page
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  //Get profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  // Products
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  // Events
  getIt.registerLazySingleton<EventRepo>(() => EventRepo(getIt()));
  getIt.registerFactory<EventCubit>(() => EventCubit(getIt()));
  // Auction
  getIt.registerLazySingleton<AuctionRepo>(() => AuctionRepo(getIt()));
  getIt.registerFactory<AuctionCubit>(() => AuctionCubit(getIt()));

}
