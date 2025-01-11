import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/components/custom_text_form_field.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppTheme.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(40),
            AppText(
              text: 'Reset Password',
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.bluTextColor,
            ),
            verticalSpace(60),
            CustomTextFormField(
              fieldLabel: 'New Password',
              focusNode: controller.fnResetPassord,
              controller: controller.tecResetPassword,
              hintText: '******',
              prefix: Image.asset(
                AppIcons.emailIcon,
                width: 20,
                height: 20,
              ),
              prefixConstraints: BoxConstraints(),
            ),
            verticalSpace(25),
            CustomTextFormField(
              fieldLabel: 'Repeat Password',
              focusNode: controller.fnResetCPassword,
              controller: controller.tecResetPasswordC,
              hintText: '******',
              prefix: Image.asset(
                AppIcons.emailIcon,
                width: 20,
                height: 20,
              ),
              prefixConstraints: BoxConstraints(),
            ),
            Spacer(),
            CustomButtonWidget(
              btnLabel: 'Continue',
              isGradientBg: true,
            ),
            verticalSpace(80),
          ],
        ),
      ),
    );
  }
}
