import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/text_styles.dart';

//ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  String btnLabel = "";

  final double borderRadius;
  final double height;
  final TextStyle? btnLabelStyle;
  final bool isGradientBg;
  final bool isWhiteBg;
  final Color bgColor;
  final Color? borderColor;
  final bool isBtnDisabled;
  final bool isIcon;
  final String? icon;
  CustomButtonWidget({
    required this.btnLabel,
    this.onTap,
    this.isIcon = false,
    this.borderRadius = 80.0,
    this.icon,
    this.height = 50.0,
    this.isWhiteBg = false,
    this.bgColor = AppTheme.primaryColor,
    this.isBtnDisabled = false,
    this.btnLabelStyle,
    this.isGradientBg = false,
    this.borderColor = AppTheme.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: height.h,
      margin: EdgeInsets.only(
        left: 0,
        right: 0,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isWhiteBg
              ? AppTheme.whiteColor
              : isGradientBg
                  ? null
                  : isBtnDisabled
                      ? AppTheme.primaryColor.withOpacity(0.6)
                      : bgColor,
          gradient: isGradientBg ? AppTheme.gradientColor : null,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppTheme.blackColor.withOpacity(0.02),
            )
          ],
          border: Border.all(
            color: isWhiteBg ? borderColor! : Colors.transparent,
          )),
      child: ElevatedButton(
        style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
        onPressed: onTap,
        child: isIcon!
            ? SvgPicture.asset(
                icon!,
                color: AppTheme.whiteColor,
              )
            : Text(
                btnLabel,
                style: btnLabelStyle ??
                    TextStyles.labelTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: isWhiteBg
                            ? AppTheme.blackColor
                            : isBtnDisabled
                                ? AppTheme.whiteColor
                                : AppTheme.whiteColor),
              ),
      ),
    );
  }
}
