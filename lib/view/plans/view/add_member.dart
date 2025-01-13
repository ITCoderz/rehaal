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

class AddMember extends StatelessWidget {
  const AddMember({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlansController>();
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
                          text: 'Member Details',
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.bluTextColor,
                        ),
                      ),
                      verticalSpace(40),
                      CustomTextFormField(
                        fieldLabel: 'Member name',
                        focusNode: controller.fnMemberName,
                        controller: controller.tecMemberName,
                        hintText: 'Enter member name...',
                        labelStyle: TextStyles.labelTextStyle.copyWith(
                            fontSize: 18.sp,
                            color: AppTheme.bluTextColor,
                            fontWeight: FontWeight.w600),
                        prefixConstraints: BoxConstraints(),
                        givePadding: true,
                      ),
                      verticalSpace(20),
                      CustomTextFormField(
                        fieldLabel: 'Phone number',
                        hintText: 'Enter phone number...',
                        focusNode: controller.fnMemberPhone,
                        controller: controller.tecMemberPhone,
                        labelStyle: TextStyles.labelTextStyle.copyWith(
                            fontSize: 18.sp,
                            color: AppTheme.bluTextColor,
                            fontWeight: FontWeight.w600),
                        prefixConstraints: BoxConstraints(),
                        givePadding: true,
                      ),
                      verticalSpace(120),
                      Center(
                        child: SizedBox(
                          height: 50.h,
                          width: Get.width * 0.6,
                          child: CustomButtonWidget(
                            btnLabel: 'Add',
                            isGradientBg: true,
                            onTap: () {
                              Member member = Member(
                                  memberName: controller.tecMemberName.text,
                                  phone: controller.tecMemberPhone.text);
                              controller.addMember(member);
                              Get.back();
                            },
                          ),
                        ),
                      )
                    ])))));
  }
}
