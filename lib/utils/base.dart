import 'package:eden_app_test/services/navigation_service.dart';
import 'package:eden_app_test/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utility {
  Utility.of(BuildContext context) {
    context = context;
  }

  static int backClickCount = 0;

  static Future<bool> onWillPop(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Press back again to exit'),
      ),
    );

    Utility.backClickCount++;

    if (Utility.backClickCount >= 2) {
      Utility.backClickCount = 0;
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    Future.delayed(const Duration(milliseconds: 2000), () {
      Utility.backClickCount = 0;
    });
    return Future.value(false);
  }

  static Widget loader({double width = 25, double height = 25}) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        strokeWidth: 2.1,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.cardColor()),
        backgroundColor: AppColors.mainBgColor(),
      ),
    );
  }
}
