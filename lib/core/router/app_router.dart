import 'package:art_space_artist/core/router/animation_transition.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/forget_password_screen.dart';
import 'package:art_space_artist/features/auth/login/presentation/views/login_screen.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/register_screen.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/verify_email_otp_screen.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/verify_email.dart';
import 'package:art_space_artist/features/events/presentation/views/event_details_screen.dart';
import 'package:art_space_artist/features/home/presentation/views/home_screen.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/views/create_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/forgetPassword/presentation/views/create_new_password.dart';
import '../../features/products/presentation/views/view_product_details.dart';
import '../di/dependency_injection.dart';
import 'app_router_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.onBoarding:
        return SlideRight(page: const OnBoardingScreen());
      case AppRouterNames.login:
        return SlideRight(
            page: BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen()));
      case AppRouterNames.register:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ));
      case AppRouterNames.verifyEmail:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const VerifyEmailScreen(),
        ));
      case AppRouterNames.forgetPassword:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordScreen(),
        ));
      case AppRouterNames.verifyEmailOPT:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const VerifyEmailOTPScreen(),
        ));
      case AppRouterNames.createNewPassword:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const CreateNewPassword(),
        ));
      case AppRouterNames.home:
        return SlideRight(page: const HomeScreen());
      case AppRouterNames.createProduct:
        return SlideRight(page: BlocProvider(
          create: (context) => getIt<ProductsCubit>(),
            child: const AddProduct()));
      case AppRouterNames.eventDetails:
        return SlideRight(page: const EventDetailsScreen());
      case AppRouterNames.viewProductDetails:
        return SlideRight(
            page: ViewProductDetails(index:settings.arguments as int));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Not Found Route"),
        ),
        body: const Center(
          child: Text("Not Found Route"),
        ),
      ),
    );
  }
}
