import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            return HomeView();
          }
          if (controller.tabIndex.value == 2) {
            return HomeView();
          }
          if (controller.tabIndex.value == 3) {
            return HomeView();
          }
          return HomeView();
        }),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
