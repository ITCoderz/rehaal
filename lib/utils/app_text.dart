import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rehaal/utils/app_theme.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle fontStyle;
  final TextStyle? style;
  final double height;
  final Color? decorationColor;

  const AppText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.style,
    this.letterSpacing,
    this.height = 1.1,
    this.fontStyle = FontStyle.normal,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decorationColor,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: style ??
          GoogleFonts.poppins(
              color: color ?? AppTheme.blackColor,
              fontSize: fontSize ?? 14.0.sp,
              letterSpacing: letterSpacing,
              height: height,
              fontStyle: fontStyle,
              fontWeight: fontWeight ?? FontWeight.w400,
              decoration: decoration ?? TextDecoration.none,
              decorationColor: decorationColor),
    );
  }
}
