import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/widgets/basic_container_widget.dart';
import 'package:flutter/material.dart';

Widget detailCard(
  BuildContext context, {
  required bool isPast,
  required child,
}) {
  return basicContainer(
    context: context,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    color: isPast
        ? AppColors.mainBgColor().withOpacity(0.5)
        : AppColors.mainBgColor().withOpacity(
            0.2,
          ),
    child: child,
  );
}
