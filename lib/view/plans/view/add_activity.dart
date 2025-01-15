import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/models/plan_model.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/text_styles.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlansController());

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
                          text: 'Activity 1',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.bluTextColor,
                        ),
                      ),
                      verticalSpace(50),
                      CustomTextFormField(
                        fieldLabel: 'Name of activity',
                        focusNode: controller.fnActivityName,
                        labelStyle: TextStyles.labelTextStyle.copyWith(
                            fontSize: 18.sp,
                            color: AppTheme.bluTextColor,
                            fontWeight: FontWeight.w600),
                        controller: controller.tecActivityName,
                        prefixConstraints: BoxConstraints(),
                        givePadding: true,
                        hintText: 'Activity Name',
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        fieldLabel: 'Date of activity',
                        labelStyle: TextStyles.labelTextStyle.copyWith(
                            fontSize: 18.sp,
                            color: AppTheme.bluTextColor,
                            fontWeight: FontWeight.w600),
                        focusNode: controller.fnActivityDate,
                        prefixConstraints: BoxConstraints(),
                        givePadding: true,
                        controller: controller.tecActivityDate,
                        hintText: '01/01/2024',
                      ),
                      verticalSpace(30),
                      CustomTextFormField(
                        fieldLabel:
                            'Does this activity involve any cost?\nIf yes, please enter the amount',
                        focusNode: controller.fnActivityAmount,
                        labelStyle: TextStyles.labelTextStyle.copyWith(
                            fontSize: 18.sp,
                            color: AppTheme.bluTextColor,
                            fontWeight: FontWeight.w600),
                        prefixConstraints: BoxConstraints(),
                        givePadding: true,
                        controller: controller.tecActivityAmount,
                        hintText: '0',
                      ),
                      verticalSpace(20),
                      AppText(
                        text: 'Who payed?',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.greyTextColor,
                      ),
                      verticalSpace(10),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppTheme.borderColor)),
                        child: Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Container(
                                  child: Column(children: [
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
                                  text: 'John',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.blackColor.withOpacity(0.8),
                                  textAlign: TextAlign.center,
                                ),
                              ]))
                          ],
                        ),
                      ),
                      verticalSpace(100),
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.6,
                          child: CustomButtonWidget(
                            btnLabel: 'Add',
                            isGradientBg: true,
                            onTap: () {
                              Activity activity = Activity(
                                  name: controller.tecActivityName.text,
                                  date: controller.tecActivityDate.text,
                                  cost: double.parse(
                                      controller.tecActivityAmount.text));
                              controller.addActivity(activity);
                              Get.back();
                            },
                          ),
                        ),
                      )
                    ])))));
  }
}
