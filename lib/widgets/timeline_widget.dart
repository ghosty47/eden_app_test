import 'package:eden_app_test/utils/app_colors.dart';
import 'package:eden_app_test/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget timelineWidget(
  BuildContext context, {
  required bool isFirst,
  required bool isLast,
  required bool isPast,
  required eventCard,
}) {
  return SizedBox(
    height: 130,
    child: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? AppColors.mainBgColor() : AppColors.mainBgColor().withOpacity(0.3),
        ),
        indicatorStyle: IndicatorStyle(
          width: 22,
          color: isPast ? AppColors.mainBgColor() : AppColors.mainBgColor().withOpacity(0.5),
          iconStyle: IconStyle(
            iconData: Icons.done_rounded,
            color: isPast ? Colors.white : AppColors.mainBgColor().withOpacity(0.1),
          ),
        ),
        endChild: detailCard(
          context,
          isPast: isPast,
          child: eventCard,
        ),
      ),
    ),
  );
}
