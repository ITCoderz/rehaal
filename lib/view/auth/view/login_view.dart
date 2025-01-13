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

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              verticalSpace(30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: AppText(
                      text: 'Login',
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
              verticalSpace(30),
              CustomTextFormField(
                fieldLabel: 'E-mail Address',
                focusNode: controller.fnEmailL,
                controller: controller.tecEmailL,
                givePadding: true,
                hintText: 'test@test.com',
                prefix: Image.asset(
                  AppIcons.emailIcon,
                  width: 20,
                  height: 20,
                ),
                prefixConstraints: BoxConstraints(),
              ),
              verticalSpace(30),
              CustomTextFormField(
                fieldLabel: 'Password',
                givePadding: true,
                focusNode: controller.fnPasswordL,
                controller: controller.tecPasswordL,
                prefix: Image.asset(
                  AppIcons.passwordIcon,
                  width: 20,
                  height: 20,
                ),
                hintText: '******',
                prefixConstraints: BoxConstraints(),
              ),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.resetPassword);
                  },
                  child: AppText(
                    text: 'Forget Password?',
                    color: AppTheme.bluTextColor,
                  ),
                ),
              ),
              Spacer(),
              CustomButtonWidget(
                btnLabel: 'Login',
                isGradientBg: true,
                onTap: () {
                  Get.toNamed(AppRoutes.bottomNavBar);
                },
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Don't have an account? ",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.greyColor,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.createAccount);
                    },
                    child: AppText(
                      text: "Create Account",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.bluTextColor,
                    ),
                  )
                ],
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
