import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/home/components/plan_container.dart';
import 'package:rehaal/view/home/controller/home_controller.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final planController = Get.put(PlansController());

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
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.profileView);
                  },
                  child: Container(
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
                ),
              ],
            ),
            Obx(() => planController.plans.isNotEmpty
                ? Column(
                    children: [
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: 'Add new Plan',
                            fontSize: 16.sp,
                            color: AppTheme.greyTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.addNewPlanView);
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
                      verticalSpace(20),
                    ],
                  )
                : SizedBox()),
            Obx(() => verticalSpace(planController.plans.isEmpty ? 70 : 20)),
            AppText(
              text: 'Your Plans',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            Obx(() => planController.plans.isEmpty
                ? Column(
                    children: [
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
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.addNewPlanView);
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
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      verticalSpace(20),
                      Container(
                          height: 450.h,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: 1.6,
                              ),
                              itemCount: planController.plans.length,
                              itemBuilder: (context, index) {
                                final plan = planController.plans[index];
                                return PlanContainer(
                                  plan: plan,
                                );
                              }))
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
