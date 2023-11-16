import 'package:flutter/material.dart';

class AppTextStyles {
  static const fontWeight400 = TextStyle(fontSize: 14.5, fontWeight: FontWeight.w400);
  static const fontWeight500 = TextStyle(fontWeight: FontWeight.w500);
  static const fontWeight600 = TextStyle(fontWeight: FontWeight.w600);
  static const fontBold = TextStyle(fontWeight: FontWeight.bold);

  static const boldFont14 = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static const boldFont15 = TextStyle(fontSize: 15, fontWeight: FontWeight.w600);

  static TextStyle boldFont27(BuildContext context) {
    return const TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w600,
    );
  }

  static const boldFont16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const boldFont17 = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  static const boldFont20 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const boldFont18 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const bigFont = TextStyle(fontSize: 30, fontWeight: FontWeight.w700);
  static const font12 = TextStyle(fontSize: 12);
  static const font13 = TextStyle(fontSize: 13);

  static const font14 = TextStyle(fontSize: 14);

  static const font15 = TextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1.6);
  static const font16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  static const font18 = TextStyle(fontSize: 18);
  static const reviewFont18 = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
}
