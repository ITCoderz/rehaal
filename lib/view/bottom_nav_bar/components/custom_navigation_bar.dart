import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/view/bottom_nav_bar/components/custom_bottom_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.only(
            left: context.width * .058,
            right: context.width * .058,
            bottom: 10),
        decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  color: AppTheme.blackColor.withOpacity(0.05),
                  blurRadius: 4)
            ],
            border: Border.all(color: AppTheme.whiteColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNavigationBarItem(
              label: 'Home',
              index: 0,
              icon: AppIcons.homeIcon,
            ),
            Spacer(),
            CustomNavigationBarItem(
              label: 'Expenses',
              index: 1,
              icon: AppIcons.expensesIcon,
            ),
            const Spacer(),
            CustomNavigationBarItem(
              label: 'AI Assistant',
              index: 2,
              icon: AppIcons.assistantIcon,
            ),
            const Spacer(),
            CustomNavigationBarItem(
              label: 'Analysis',
              index: 3,
              icon: AppIcons.analysisIcon,
            ),
          ],
        ),
      ),
    );
  }
}
