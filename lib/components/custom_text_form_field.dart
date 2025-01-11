import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/utils/text_styles.dart';
import 'package:rehaal/utils/ui_gaps.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.backgroundColor = AppTheme.whiteColor,
    required this.fieldLabel,
    required this.focusNode,
    this.autofocus = false,
    this.showEditIcon = false,
    this.onEditTap,
    this.onTap,
    this.textStyle,
    this.labelStyle,
    this.obscureText = false,
    this.labelFieldSpace = 10,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.borderColor = AppTheme.borderColor,
    this.filled = true,
    this.inputFormatters,
    this.validator,
    this.isViewMode = false,
    this.onChanged,
  });

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode focusNode;
  final void Function()? onEditTap;
  final double labelFieldSpace;

  final bool? autofocus;
  final void Function()? onTap;
  final TextStyle? textStyle;

  final bool? obscureText;
  final bool showEditIcon;
  final String fieldLabel;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;
  final Color borderColor;

  final String? hintText;

  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;
  final Color? backgroundColor;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final bool isViewMode;
  List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                text: fieldLabel,
                color: Color(0xffADADAD),
              )
            ],
          ).paddingOnly(left: 15),
          verticalSpace(labelFieldSpace),
          TextFormField(
            readOnly: isViewMode,
            autovalidateMode: AutovalidateMode.disabled,
            controller: controller,
            focusNode: focusNode,
            onTap: onTap,
            style: textStyle ??
                TextStyles.labelTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blackColor),
            obscureText: obscureText!,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            maxLines: maxLines ?? 1,
            cursorColor: AppTheme.primaryColor,
            decoration: decoration,
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      );

  InputDecoration get decoration => InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: hintText ?? "",

        hintStyle: hintStyle ??
            TextStyles.labelTextStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.blackColor.withOpacity(0.5)),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
          child: prefix,
        ),
        prefixIconConstraints: prefixConstraints,

        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        errorStyle: TextStyles.labelTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: 0,
            backgroundColor: Colors.transparent,
            color: AppTheme.redColor),

        contentPadding: contentPadding ??
            EdgeInsets.only(
              top: 12,
              right: 15,
              bottom: 15,
              left: 12,
            ),
        filled: true,
        fillColor: fillColor ?? AppTheme.whiteColor,
        // filled: filled,
        // border: InputBorder.none,
        border: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 0.5),
              borderRadius: BorderRadius.circular(36),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(36),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
              borderSide: BorderSide(color: borderColor, width: 0.5),
            ),
      );
}
