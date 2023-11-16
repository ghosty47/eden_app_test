import 'package:flutter/material.dart';

Widget basicContainer({
  required BuildContext context,
  required Widget child,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  Function()? onTap,
  double? height,
  double? width,
  Color? color,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: child,
    ),
  );
}
