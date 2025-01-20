import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';
import 'package:rehaal/view/home/components/plan_container.dart';
import 'package:rehaal/view/home/controller/home_controller.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';
import 'package:rehaal/view/profile/controller/profile_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(), permanent: true);
    final authController = Get.put(AuthController());
    final profileController = Get.put(ProfileController());

    controller.loadPlansFromStorage();
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Hello ${authController.tecNameS.text ?? ''}',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.blackColor,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.profileView);
                    },
                    child: Obx(
                      () => Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xffF9FDFC),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          image: profileController
                                  .selectedImagePath.value.isNotEmpty
                              ? DecorationImage(
                                  image: FileImage(File(profileController
                                      .selectedImagePath.value)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: profileController.selectedImagePath.value.isEmpty
                            ? Center(
                                child: Icon(
                                  Icons.person,
                                  color: AppTheme.primaryColor,
                                  size: 30,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => controller.plans.isNotEmpty
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
                                controller.members.clear();
                                controller.activities.clear();
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
              Obx(() => verticalSpace(controller.plans.isEmpty ? 70 : 20)),
              AppText(
                text: 'Your Plans',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              Obx(() => controller.plans.isEmpty
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
                                controller.members.clear();
                                controller.activities.clear();
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
                                itemCount: controller.plans.length,
                                itemBuilder: (context, index) {
                                  final plan = controller.plans[index];
                                  print('Plan ${index + 1}: ${plan.toJson()}');
                                  return InkWell(
                                    onTap: () {
                                      print('Member : ${plan.members}');
                                      print('Activities : ${plan.activities}');

                                      Get.toNamed(AppRoutes.addNewPlanView,
                                          arguments: {
                                            'isView': true,
                                            'isEdit': false,
                                            'planModel': plan
                                          });
                                    },
                                    child: PlanContainer(
                                      plan: plan,
                                    ),
                                  );
                                }))
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
