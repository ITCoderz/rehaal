import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pinput/pinput.dart';
import 'package:rehaal/components/custom_button_widget.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/text_styles.dart';
import 'package:rehaal/utils/ui_gaps.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 65.w,
      height: 65.h,
      textStyle: TextStyles.labelTextStyle.copyWith(
        fontSize: 22.sp,
        color: AppTheme.bluTextColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.borderColor, width: 2),
      ),
    );
    final filledPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(
        color: AppTheme.bluTextColor,
        width: 2,
      )),
    );

    final emptyPinTheme = defaultPinTheme;
    return Scaffold(
        backgroundColor: AppTheme.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppTheme.whiteColor,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              verticalSpace(40),
              Center(
                child: AppText(
                  text: 'Verify',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.bluTextColor,
                ),
              ),
              verticalSpace(30),
              Center(
                child: AppText(
                  text: 'Please enter the 4-digit code\n sent to your Email',
                  color: Color(0xff2A4798),
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(80),
              Pinput(
                defaultPinTheme: emptyPinTheme,
                submittedPinTheme: filledPinTheme,
                focusedPinTheme: filledPinTheme.copyDecorationWith(
                  border: Border.all(
                    color: AppTheme.bluTextColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              verticalSpace(60),
              AppText(
                text: 'Resend OTP',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.bluTextColor,
              ),
              Spacer(),
              CustomButtonWidget(
                btnLabel: 'Continue',
                isGradientBg: true,
                onTap: () {
                  Get.toNamed(AppRoutes.newPassword);
                },
              ),
              verticalSpace(80),
            ])));
  }
}
