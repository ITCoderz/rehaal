import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';

import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.splashImage,
                width: 217.w,
                height: 292.h,
              ),
              verticalSpace(40),
              AppText(
                text: 'Welcome to Rehaal',
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ),
              verticalSpace(120),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.loginView);
                },
                child: Container(
                  width: 76.w,
                  height: 76.h,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.forwardIcon),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
