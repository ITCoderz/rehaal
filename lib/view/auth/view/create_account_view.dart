import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppTheme.whiteColor,
          surfaceTintColor: AppTheme.whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: AppText(
                        text: 'Create Account',
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.bluTextColor,
                      ),
                    ),
                    Image.asset(
                      AppImages.appLogo,
                      width: 140.w,
                      height: 140.h,
                    )
                  ],
                ),
                verticalSpace(20),
                Form(
                    key: controller.createAccountKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          fieldLabel: 'Enter your full name',
                          focusNode: controller.fnNameS,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Full Name';
                            }
                            return null;
                          },
                          givePadding: true,
                          controller: controller.tecNameS,
                          hintText: 'Your name...',
                          prefix: Icon(
                            Icons.person,
                            color: AppTheme.iconColor,
                          ),
                          prefixConstraints: BoxConstraints(),
                        ),
                        verticalSpace(20),
                        CustomTextFormField(
                          fieldLabel: 'Enter your email',
                          givePadding: true,
                          focusNode: controller.fnEmailS,
                          controller: controller.tecEmailS,
                          hintText: 'test@test.com',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          prefix: Image.asset(
                            AppIcons.emailIcon,
                            width: 20,
                            height: 20,
                          ),
                          prefixConstraints: BoxConstraints(),
                        ),
                        verticalSpace(20),
                        CustomTextFormField(
                          fieldLabel: 'DOB',
                          isViewMode: true,
                          givePadding: true,
                          focusNode: controller.fnDobS,
                          controller: controller.tecDobS,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your DOB';
                            }
                            return null;
                          },
                          onTap: () {
                            controller.selectDOB(context);
                          },
                          hintText: '1/1/2024',
                          prefix: Icon(
                            Icons.calendar_month_outlined,
                            color: AppTheme.iconColor,
                          ),
                          prefixConstraints: BoxConstraints(),
                        ),
                        verticalSpace(20),
                        CustomTextFormField(
                          fieldLabel: 'Enter your password',
                          givePadding: true,
                          focusNode: controller.fnPasswordS,
                          obscureText: true,
                          controller: controller.tecPasswordS,
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                            }
                            return null;
                          },
                          prefix: Image.asset(
                            AppIcons.passwordIcon,
                            width: 20,
                            height: 20,
                          ),
                          hintText: '******',
                          prefixConstraints: BoxConstraints(),
                        ),
                        verticalSpace(20),
                        CustomTextFormField(
                          fieldLabel: 'Re-enter Password',
                          focusNode: controller.fnCPasswordS,
                          givePadding: true,
                          obscureText: true,
                          controller: controller.tecCPasswordS,
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                            }
                            return null;
                          },
                          prefix: Image.asset(
                            AppIcons.passwordIcon,
                            width: 20,
                            height: 20,
                          ),
                          hintText: '******',
                          prefixConstraints: BoxConstraints(),
                        ),
                      ],
                    )),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() => Checkbox(
                          value: controller.isCheck.value,
                          onChanged: (bak) {
                            controller.isCheck.value = bak!;
                          },
                          activeColor: AppTheme.primaryColor,
                        )),
                    AppText(
                      text: "I have read the ",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.blackColor,
                    ),
                    AppText(
                      text: "Terms of Services",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryColor,
                    )
                  ],
                ),
                verticalSpace(20),
                CustomButtonWidget(
                  btnLabel: 'Create',
                  isGradientBg: true,
                  onTap: () {
                    if (controller.isCheck.value) {
                      if (controller.createAccountKey.currentState!
                          .validate()) {
                        Get.toNamed(AppRoutes.bottomNavBar);
                      }
                    } else {
                      Get.snackbar('Alert', "Please read the Terms of Services",
                          backgroundColor: AppTheme.redColor,
                          colorText: AppTheme.whiteColor);
                    }
                  },
                ),
                verticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
