import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelimeTile extends StatelessWidget {
  const MyTimelimeTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.date,
      required this.title});
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String date;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000.w,
      child: TimelineTile(
        lineXY: 0.2,
        isFirst: isFirst,
        isLast: isLast,
        alignment: TimelineAlign.manual,
        beforeLineStyle: LineStyle(
            color: isPast ? AppTheme.primaryColor : AppTheme.iconColor,
            thickness: 2),
        startChild: AppText(
          text: '5 Jun',
          fontSize: 13.sp,
          fontWeight: FontWeight.w300,
          color: AppTheme.blackColor,
        ),
        indicatorStyle: IndicatorStyle(
          width: 25.w,
          indicator: Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isPast ? AppTheme.primaryColor : Colors.transparent,
                  border: Border.all(
                      color:
                          isPast ? AppTheme.primaryColor : AppTheme.iconColor,
                      width: 2)),
              child: Center(
                child: Icon(
                  Icons.location_on,
                  color: isPast ? AppTheme.whiteColor : Colors.transparent,
                  size: 15,
                ),
              )),
        ),
        endChild: SizedBox(
          height: 80.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpace(10),
              AppText(
                text: 'Visit the Louvre Museum',
                fontSize: 16.sp,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
              horizontalSpace(20),
              Container(
                width: 43.w,
                height: 43.h,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: AppTheme.whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
