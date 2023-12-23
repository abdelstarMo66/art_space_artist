import 'package:art_space_artist/core/router/animation_transition.dart';
import 'package:art_space_artist/features/auth/presentation/views/login_screen.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/onboardingScreen.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.onBoarding:
        return SlideRight(page: const OnBoardingScreen());
      case AppRouterNames.login:
        return SlideRight(page: const LoginScreen());
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
