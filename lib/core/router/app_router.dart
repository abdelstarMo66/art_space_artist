import 'package:art_space_artist/core/router/animation_transition.dart';
import 'package:art_space_artist/features/auth/presentation/views/create_new_password.dart';
import 'package:art_space_artist/features/auth/presentation/views/forget_password.dart';
import 'package:art_space_artist/features/auth/presentation/views/login_screen.dart';
import 'package:art_space_artist/features/auth/presentation/views/register_screen.dart';
import 'package:art_space_artist/features/auth/presentation/views/verify_email_screen.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.onBoarding:
        return SlideRight(page: OnBoardingScreen());
      case AppRouterNames.login:
        return SlideRight(page: LoginScreen());
      case AppRouterNames.register:
        return SlideRight(page: const RegisterScreen());
      case AppRouterNames.forgetPassword:
        return SlideRight(page: const ForgetPassword());
      case AppRouterNames.verifyEmail:
        return SlideRight(page: const VerifyEmailScreen());
      case AppRouterNames.createNewPassword:
        return SlideRight(page: const CreateNewPassword());
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
