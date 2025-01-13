import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/bottom_nav_bar/controller/bottom_bar_controller.dart';
import 'package:rehaal/view/plans/components/my_timelime_tile.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';

class ViewActivities extends StatelessWidget {
  const ViewActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlansController());
    final bottomController = Get.put(BottomBarController());

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppTheme.whiteColor,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: AppTheme.whiteColor,
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: AppText(
                          text: 'View Activities',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.bluTextColor,
                        ),
                      ),
                      Obx(() => controller.isActivityAdded.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: 'Add new activity',
                                      fontSize: 16.sp,
                                      color: AppTheme.greyTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.addNewActivity);
                                      },
                                      child: Container(
                                        width: 47.w,
                                        height: 47.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppTheme.primaryColor),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: AppTheme.whiteColor,
                                            size: 35,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpace(40),
                                AppText(
                                  text: 'SWITZERLAND',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                verticalSpace(10),
                                Image.asset(AppImages.activityImage),
                                verticalSpace(20),
                                Row(
                                  children: [
                                    AppText(
                                      text: 'Schedule',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    horizontalSpace(10),
                                    SvgPicture.asset(
                                      AppIcons.editIcon,
                                      color: AppTheme.iconColor,
                                    )
                                  ],
                                ),
                                verticalSpace(10),
                                MyTimelimeTile(
                                  isFirst: true,
                                  isLast: false,
                                  isPast: true,
                                  date: '5 Jun',
                                  title: 'Visit The Louvre Museum',
                                ),
                                MyTimelimeTile(
                                  isFirst: false,
                                  isLast: false,
                                  isPast: true,
                                  date: '5 Jun',
                                  title: 'Visit  Disneyland Paris',
                                ),
                                MyTimelimeTile(
                                  isFirst: false,
                                  isLast: true,
                                  isPast: false,
                                  date: '6 Jun',
                                  title: 'Coconut grove',
                                ),
                                verticalSpace(20),
                                Center(
                                  child: SizedBox(
                                    width: Get.width * 0.6,
                                    child: CustomButtonWidget(
                                      btnLabel: '',
                                      isIcon: true,
                                      onTap: () {
                                        Get.close(2);
                                        bottomController.tabIndex.value = 0;
                                      },
                                      icon: AppIcons.homeIcon,
                                      isGradientBg: true,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : NoActivityFound(controller: controller))
                    ])))));
  }
}

class NoActivityFound extends StatelessWidget {
  const NoActivityFound({
    super.key,
    required this.controller,
  });

  final PlansController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(50),
        Stack(children: [
          RotationTransition(
              turns: controller.animationController,
              child: Image.asset(AppImages.loadingCircles)),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                AppIcons.activityIcon,
                width: 150.w,
                height: 150.h,
              ),
            ),
          ),
        ]),
        verticalSpace(25),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppText(
            text: 'Add new activity',
            fontSize: 16.sp,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.w500,
          ),
          horizontalSpace(20),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.addNewActivity);
            },
            child: Container(
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
            ),
          )
        ])
      ],
    );
  }
}
