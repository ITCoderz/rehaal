import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/bottom_nav_bar/controller/bottom_bar_controller.dart';

class CustomNavigationBarItem extends StatelessWidget {
  String? label;
  int? index;
  String? icon;

  CustomNavigationBarItem({
    this.label,
    this.index,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomBarController>();

    return InkWell(
      onTap: () {
        if (controller.tabIndex.value != index) {
          controller.changeTabIndex(index!);
        }
      },
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(10),
            SvgPicture.asset(
              icon!,
              height: 25,
              color: controller.tabIndex.value == index
                  ? AppTheme.primaryColor
                  : AppTheme.greyColor,
            ),
            verticalSpace(3),
            AppText(
                text: label.toString(),
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: controller.tabIndex.value == index
                    ? AppTheme.primaryColor
                    : AppTheme.greyColor),
          ],
        ),
      ),
    );
  }
}
