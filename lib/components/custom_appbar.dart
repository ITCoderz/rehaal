
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehaal/utils/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final double elevation;
  final List<Widget>? actions;
  final bool showbackIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.showbackIcon = true,
    this.actions,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation, // Adds elevation effect
      shadowColor: AppTheme.whiteColor.withOpacity(0.2),
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Align left and right
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  if (showbackIcon)
                    GestureDetector(
                      onTap: onBackPressed ?? () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                  if (showbackIcon) const SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              if (actions != null) ...actions!, // Add actions to the right
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
}
