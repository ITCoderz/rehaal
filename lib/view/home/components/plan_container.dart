import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehaal/models/plan_model.dart';
import 'package:rehaal/utils/app_icons.dart';
import 'package:rehaal/utils/app_images.dart';
import 'package:rehaal/utils/app_text.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';

class PlanContainer extends StatelessWidget {
  const PlanContainer({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    final planController = Get.put(PlansController());

    return Container(
      width: 144.w,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AppImages.planImage,
              fit: BoxFit.cover,
              width: 144.w,
              height: 200.h,
            ),
          ),
          Positioned(
              left: 20,
              top: 10,
              child: AppText(
                text:
                    "${DateFormat('d MMM').format(plan.startDate)}-${DateFormat('d MMM').format(plan.endDate)}",
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppTheme.whiteColor,
              )),
          Positioned(
              left: 10,
              bottom: 30,
              child: AppText(
                text: plan.destinationName,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppTheme.whiteColor,
              )),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
                final position = details.globalPosition;
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    position.dx,
                    position.dy,
                    position.dx,
                    position.dy,
                  ),
                  items: [
                    PopupMenuItem(
                      value: 'edit',
                      child: AppText(
                        text: 'Edit',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.greyTextColor,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: AppText(
                        text: 'Delete',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.greyTextColor,
                      ),
                    ),
                  ],
                ).then((value) {
                  if (value == 'edit') {
                    print('Edit selected');
                  } else if (value == 'delete') {
                    planController.removePlan(plan);
                  }
                });
              },
              child: SvgPicture.asset(
                AppIcons.menuIcon,
                height: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
