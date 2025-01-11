import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Hello Ali',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.blackColor,
                ),
                Container(
                  width: 54.w,
                  height: 54.h,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.primaryColor, width: 2),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: AppTheme.bluTextColor,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(70),
            AppText(
              text: 'Your Plans',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(60),
            Center(
              child: Image.asset(
                AppImages.appLogo,
                width: 250.w,
              ),
            ),
            verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'Add new Plan',
                  fontSize: 16.sp,
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                horizontalSpace(20),
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
