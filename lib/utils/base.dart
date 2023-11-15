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
}
