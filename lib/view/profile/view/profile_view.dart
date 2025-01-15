import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/profile/controller/profile_controller.dart';

import '../../../utils/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Center(
                      child: AppText(
                        text: 'Profile Details',
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.bluTextColor,
                      ),
                    ),
                  ),
                  verticalSpace(50),
                  Stack(clipBehavior: Clip.none, children: [
                    Obx(
                      () => Container(
                        width: 110,
                        height: 110,
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
                          image: controller.selectedImage.value != null
                              ? DecorationImage(
                                  image: FileImage(
                                      controller.selectedImage.value!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: controller.selectedImage.value == null
                            ? Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                  size: 50,
                                ),
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: -10,
                        child: GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            width: 44.w,
                            padding: EdgeInsets.only(top: 5),
                            height: 44.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppTheme.whiteColor,
                                  width: 2,
                                ),
                                gradient: AppTheme.gradientColor),
                            child: Center(
                              child: SvgPicture.asset(AppIcons.cameraIcon),
                            ),
                          ),
                        ))
                  ]),
                  verticalSpace(70),
                  CustomTextFormField(
                    fieldLabel: 'Name',
                    focusNode: controller.fnName,
                    controller: controller.tecName,
                    givePadding: true,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SvgPicture.asset(
                        AppIcons.editIcon,
                        color: AppTheme.iconColor,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(),
                    prefixConstraints: BoxConstraints(),
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    fieldLabel: 'Email Address',
                    focusNode: controller.fnEmail,
                    controller: controller.tecEmail,
                    givePadding: true,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SvgPicture.asset(
                        AppIcons.editIcon,
                        color: AppTheme.iconColor,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(),
                    prefixConstraints: BoxConstraints(),
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    fieldLabel: 'DOB',
                    focusNode: controller.fnDob,
                    onTap: () {
                      controller.selectDOB(context);
                    },
                    controller: controller.tecDob,
                    givePadding: true,
                    prefix: Icon(
                      Icons.calendar_month,
                      color: AppTheme.iconColor,
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SvgPicture.asset(
                        AppIcons.editIcon,
                        color: AppTheme.iconColor,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(),
                    prefixConstraints: BoxConstraints(),
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    fieldLabel: 'Password',
                    focusNode: controller.fnPasswod,
                    controller: controller.tecPassword,
                    givePadding: true,
                    obscureText: true,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SvgPicture.asset(
                        AppIcons.editIcon,
                        color: AppTheme.iconColor,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(),
                    prefixConstraints: BoxConstraints(),
                  ),
                  verticalSpace(60),
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Center(
                      child: CustomButtonWidget(
                        btnLabel: 'Save',
                        isGradientBg: true,
                      ),
                    ),
                  )
                ])))));
  }
}
