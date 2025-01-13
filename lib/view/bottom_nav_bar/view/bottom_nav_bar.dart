import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/view/ai_assistant/view/ai_assistant.dart';
import 'package:rehaal/view/bottom_nav_bar/components/custom_navigation_bar.dart';
import 'package:rehaal/view/bottom_nav_bar/controller/bottom_bar_controller.dart';
import 'package:rehaal/view/home/view/home_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController(), permanent: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          if (controller.tabIndex.value == 0) {
            return HomeView();
          }
          if (controller.tabIndex.value == 1) {
            return Center(
              child: AppText(
                text: 'Expenses',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            );
          }
          if (controller.tabIndex.value == 2) {
            return AiAssistant();
          }
          if (controller.tabIndex.value == 3) {
            return Center(
              child: AppText(
                text: 'Analysis',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            );
          }
          return HomeView();
        }),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
