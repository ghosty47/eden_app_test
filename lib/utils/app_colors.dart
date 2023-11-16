import 'package:flutter/material.dart';

class AppColors {
  static Color mainBgColor({opacity = 1.0}) {
    return const Color(0xFF03a84e).withOpacity(opacity);
  }

  static Color mainColor({opacity = 1.0}) {
    return const Color(0xFF478EFF).withOpacity(opacity);
  }

  static Color scaffoldBgColor({opacity = 1.0}) {
    return const Color(0xFFFAF9F6).withOpacity(opacity);
  }

  static Color cardColor({opacity = 1.0}) {
    return const Color(0xFFFFFFFF).withOpacity(opacity);
  }
}
