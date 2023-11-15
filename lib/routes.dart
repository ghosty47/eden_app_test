import 'package:eden_app_test/views/onboarding/onboarding.dart';
import 'package:eden_app_test/views/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes(String routeName);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case SplashScreenView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreenView());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: SafeArea(
              child: SizedBox(
                child: Text("Page not found"),
              ),
            ),
          ),
        );
    }
  }
}
