import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AuthController extends ControllerMVC {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool processing = true;
  String selectedRole = '';
  OverlayEntry? loader;

  // void login() async {
  //   FocusScope.of(scaffoldKey.currentContext!).unfocus();
  //   if (loginFormKey.currentState!.validate()) {
  //     loader = Utility.load(scaffoldKey.currentContext!);

  //     loginFormKey.currentState!.save();
  //     authRepository.login(account).then((res) async {
  //       Account r = res;
  //       await SharedPrefsManager.saveToken(r.token as String);
  //       await SharedPrefsManager.setAccount(r);

  //       /// Navigate to Home Page
  //       Navigator.of(scaffoldKey.currentContext!).pushNamed(Dashboard.routeName);

  //       getAccount(scaffoldKey.currentContext!, force: true);
  //     }).catchError((err) {
  //       if (err is ErrorHint) {
  //         showToast(scaffoldKey.currentContext!, message: err.value[0].toString().toTitleCase());
  //         return null;
  //       } else if (err is DioException) {
  //         showToast(scaffoldKey.currentContext!, message: err.message);
  //         if (err.response!.statusCode! == kExpectationFailed) {
  //           resendVerificationOtp(account.email!);
  //           Navigator.of(scaffoldKey.currentContext!).pushNamed(
  //             EmailVerificationView.routeName,
  //             arguments: EmailVerificationArgs(email: account.email!),
  //           );
  //         }
  //         return null;
  //       }
  //       showToast(scaffoldKey.currentContext!, message: "Something went wrong");
  //     }).whenComplete(() {
  //       loader!.remove();
  //     });
  //   }
  // }

  AuthController();
}
