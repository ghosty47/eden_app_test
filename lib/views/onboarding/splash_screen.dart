import 'dart:async';

import 'package:eden_app_test/controllers/auth_controller.dart';
import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/views/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = '/splash_screen';

  const SplashScreenView({Key? key}) : super(key: key);

  @override
  SplashScreenViewState createState() => SplashScreenViewState();
}

class SplashScreenViewState extends StateMVC<SplashScreenView> {
  SplashScreenViewState() : super(AuthController()) {
    con = controller as AuthController;
  }

  late AuthController con;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor().withOpacity(1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
