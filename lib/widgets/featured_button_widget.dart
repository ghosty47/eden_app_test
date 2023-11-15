import 'package:flutter/material.dart';

Widget featuredNewBtn(
  BuildContext context, {
  required String text,
  required Color btnColor,
  required VoidCallback onPressed,
  Widget? icon,
  Color? btnTextColor,
  double? width,
  double? height,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: btnTextColor,
              backgroundColor: btnColor,
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: Text(text),
          )
        : ElevatedButton.icon(
            icon: icon,
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: btnTextColor,
              backgroundColor: btnColor,
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            label: Text(text),
          ),
  );
}
