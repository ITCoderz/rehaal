import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/text_styles.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';

class AddDurationView extends StatelessWidget {
  const AddDurationView({super.key});

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
                    child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: AppText(
                          text: 'Duration',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.bluTextColor,
                        ),
                      ),
                      Image.asset(
                        AppImages.durationImage,
                        width: 183.w,
                        height: 183.h,
                      )
                    ],
                  ),
                  verticalSpace(50),
                  CustomTextFormField(
                    fieldLabel: 'Start date',
                    focusNode: controller.fnDurationSDate,
                    onTap: () {
                      controller.selectDate(context, isStartDate: true);
                    },
                    isViewMode: true,
                    labelStyle: TextStyles.labelTextStyle.copyWith(
                        fontSize: 18.sp,
                        color: AppTheme.bluTextColor,
                        fontWeight: FontWeight.w600),
                    controller: controller.tecDurationSDate,
                    prefixConstraints: BoxConstraints(),
                    givePadding: true,
                    hintText: '01/01/2024',
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    fieldLabel: 'End date',
                    isViewMode: true,
                    onTap: () {
                      controller.selectDate(context, isStartDate: false);
                    },
                    labelStyle: TextStyles.labelTextStyle.copyWith(
                        fontSize: 18.sp,
                        color: AppTheme.bluTextColor,
                        fontWeight: FontWeight.w600),
                    focusNode: controller.fnDurationEDate,
                    prefixConstraints: BoxConstraints(),
                    givePadding: true,
                    controller: controller.tecDurationEDate,
                    hintText: '01/01/2024',
                  ),
                  verticalSpace(100),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: Center(
                      child: CustomButtonWidget(
                        btnLabel: 'Add',
                        isGradientBg: true,
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                  )
                ])))));
  }
}
