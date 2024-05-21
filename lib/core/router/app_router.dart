import 'package:art_space_artist/core/router/animation_transition.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/forget_password_screen.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/verify_email_otp_screen.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/login/presentation/views/login_screen.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/register_screen.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/verify_email_screen.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_cubit.dart';
import 'package:art_space_artist/features/events/presentation/views/create_event_screen.dart';
import 'package:art_space_artist/features/events/presentation/views/event_details_screen.dart';
import 'package:art_space_artist/features/home/presentation/views/home_screen.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/views/add_product.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/forgetPassword/presentation/views/create_new_password.dart';
import '../../features/products/presentation/views/view_product_details.dart';
import '../../features/profile/presentation/views/change_password/change_password.dart';
import '../../features/profile/presentation/views/edit_profile/edit_profile_screen.dart';
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
            page: BlocProvider.value(
          value: getIt<RegisterCubit>(),
          child: VerifyEmailScreen(email: settings.arguments as String),
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
          child: VerifyEmailOTPScreen(email: settings.arguments as String),
        ));
      case AppRouterNames.createNewPassword:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: CreateNewPassword(email: settings.arguments as String),
        ));
      case AppRouterNames.home:
        return SlideRight(page: const HomeScreen());
      case AppRouterNames.createProduct:
        return SlideRight(
            page: BlocProvider(
                create: (context) => getIt<ProductsCubit>(),
                child: const AddProduct()));
      case AppRouterNames.eventDetails:
        return SlideRight(
          page: BlocProvider<EventCubit>(
            create: (context) => getIt<EventCubit>()
              ..emitGetEventDetails(eventId: settings.arguments as String),
            child: const EventDetailsScreen(),
          ),
        );
      case AppRouterNames.viewProductDetails:
        return SlideRight(
          page: BlocProvider<ProductsCubit>(
            create: (context) => getIt<ProductsCubit>()
              ..emitGetProductDetails(productId: settings.arguments as String),
            child: const ViewProductDetails(),
          ),
        );
      case AppRouterNames.editProfile:
        return SlideRight(
            page: BlocProvider.value(
                value: getIt<ProfileCubit>(),
                child: const EditProfileScreen()));
      case AppRouterNames.changePassword:
        return SlideRight(
            page: BlocProvider.value(
                value: getIt<ProfileCubit>(),
                child: const ChangePasswordScreen()));
      case AppRouterNames.createEvent:
        return SlideRight(
            page: BlocProvider(
                create: (context) => getIt<EventCubit>(),
                child: const CreateEvent()));

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
