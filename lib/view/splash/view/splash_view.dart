import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/view/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Center(
        child: Image.asset(
          AppImages.splashImage,
          width: 250.w,
        ),
      ),
    );
  }
}
