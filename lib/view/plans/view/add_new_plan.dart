import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/models/plan_model.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';

class AddNewPlanView extends StatelessWidget {
  const AddNewPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlansController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return controller.isImageSelected.value
                    ? Stack(
                        children: [
                          Image.asset(AppImages.planImage),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Icon(
                                Icons.arrow_back,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox();
              }),
              Obx(() => controller.isImageSelected.value
                  ? SizedBox()
                  : Column(
                      children: [
                        verticalSpace(30),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back)),
                        verticalSpace(30),
                      ],
                    ).paddingSymmetric(horizontal: 20)),
              Obx(() {
                return !controller.isImageSelected.value
                    ? Center(
                        child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            AppIcons.imageIcon,
                            width: 143.w,
                            height: 135.h,
                          ),
                          Positioned(
                            bottom: -30,
                            right: -30,
                            child: InkWell(
                              onTap: () {
                                controller.isImageSelected.value = true;
                              },
                              child: Container(
                                width: 55.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                    color: Color(0xff71AEF3).withOpacity(0.7),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Color(
                                      0xff3863AA,
                                    ),
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                    : SizedBox();
              }),
              Obx(() =>
                  verticalSpace(controller.isImageSelected.value ? 50 : 100)),
              Column(
                children: [
                  CustomTextFormField(
                    fieldLabel: 'Destination name',
                    focusNode: controller.fnDestination,
                    givePadding: true,
                    controller: controller.tecDestination,
                    hintText: 'Enter destination name...',
                    prefixConstraints: BoxConstraints(),
                  ),
                  verticalSpace(20),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.addDurationView);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 47.w,
                          height: 47.h,
                          decoration: BoxDecoration(
                              color: Color(0xffEff5fb), shape: BoxShape.circle),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppTheme.iconColor,
                          ),
                        ),
                        horizontalSpace(20),
                        AppText(
                          text: 'Duration',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.blackColor.withOpacity(0.6),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: AppTheme.iconColor,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(5),
                  Container(
                    height: 4.h,
                    color: AppTheme.borderColor2,
                  ),
                  verticalSpace(20),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.viewActivities);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 47.w,
                          height: 47.h,
                          decoration: BoxDecoration(
                              color: Color(0xffEff5fb), shape: BoxShape.circle),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppTheme.iconColor,
                          ),
                        ),
                        horizontalSpace(20),
                        AppText(
                          text: 'View Activity',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.blackColor.withOpacity(0.6),
                        ),
                        Spacer(),
                        Icon(
                          Icons.map_outlined,
                          color: AppTheme.iconColor,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(5),
                  Container(
                    height: 4.h,
                    color: AppTheme.borderColor2,
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    fieldLabel: 'Set Budget',
                    focusNode: controller.fnBudget,
                    controller: controller.tecBudget,
                    textInputType: TextInputType.number,
                    prefixConstraints: BoxConstraints(),
                    givePadding: true,
                    hintText: 'Enter budget...',
                  ),
                  verticalSpace(20),
                  Obx(() {
                    if (controller.members.isEmpty) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: 'Do you want to add travel members?',
                            fontSize: 16.sp,
                            color: AppTheme.greyTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                          horizontalSpace(10),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.addMember);
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
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Travel Members',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          verticalSpace(10),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(14),
                                border:
                                    Border.all(color: AppTheme.borderColor)),
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 30,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.addMember);
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppTheme.primaryColor),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: AppTheme.primaryColor,
                                            ),
                                          ),
                                        ),
                                        verticalSpace(5),
                                        AppText(
                                          text: 'Add',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ...controller.members.map((member) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppTheme.primaryColor),
                                          child: Center(
                                            child: Icon(
                                              Icons.person,
                                              color: AppTheme.whiteColor,
                                            ),
                                          ),
                                        ),
                                        verticalSpace(5),
                                        AppText(
                                          text: member.memberName,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.visible,
                                          color: AppTheme.blackColor
                                              .withOpacity(0.8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  }),
                  verticalSpace(20),
                  Center(
                    child: SizedBox(
                      width: Get.width * 0.6,
                      child: CustomButtonWidget(
                        btnLabel: 'Add',
                        isGradientBg: true,
                        onTap: () {
                          String errorMessage = '';
                          // Validate fields
                          if (controller.tecDestination.text.isEmpty) {
                            errorMessage = 'Please enter a destination name.';
                          } else if (controller.tecBudget.text.isEmpty) {
                            errorMessage = 'Please enter a budget.';
                          } else if (controller.tecDurationSDate.text.isEmpty ||
                              controller.tecDurationEDate.text.isEmpty) {
                            errorMessage = 'Please select start and end dates.';
                          } else if (controller.members.isEmpty) {
                            errorMessage = 'Please add at least one member.';
                          }

                          if (errorMessage.isNotEmpty) {
                            Get.snackbar(
                              'Validation Error',
                              errorMessage,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }
                          PlanModel plan = PlanModel(
                              destinationName: controller.tecDestination.text,
                              budget: double.parse(controller.tecBudget.text),
                              startDate: DateFormat('dd/MM/yyyy')
                                  .parse(controller.tecDurationSDate.text),
                              endDate: DateFormat('dd/MM/yyyy')
                                  .parse(controller.tecDurationEDate.text),
                              members: controller.members);
                          controller.addPlan(plan);
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  verticalSpace(20),
                ],
              ).paddingSymmetric(horizontal: 20)
            ],
          ),
        ),
      ),
    );
  }
}
