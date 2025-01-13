import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehaal/models/plan_model.dart';
import 'package:rehaal/utils/app_theme.dart';

class PlansController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final fnDestination = FocusNode();
  final fnBudget = FocusNode();
  final fnDurationSDate = FocusNode();
  final fnActivityName = FocusNode();
  final fnActivityAmount = FocusNode();
  final fnActivityDate = FocusNode();
  final fnDurationEDate = FocusNode();
  final fnMemberName = FocusNode();
  final fnMemberPhone = FocusNode();

  final tecDestination = TextEditingController();
  final tecBudget = TextEditingController();
  final tecDurationSDate = TextEditingController();
  final tecDurationEDate = TextEditingController();
  final tecActivityName = TextEditingController();
  final tecActivityDate = TextEditingController();
  final tecActivityAmount = TextEditingController();
  final tecMemberName = TextEditingController();
  final tecMemberPhone = TextEditingController();

  RxBool isActivityAdded = false.obs;
  RxBool isImageSelected = false.obs;
  RxInt activeStep = 0.obs;
  RxList<Member> members = <Member>[].obs;
  RxList<PlanModel> plans = <PlanModel>[].obs;

  void addMember(Member member) {
    members.add(member);
  }

  void addPlan(PlanModel plan) {
    plans.add(plan);
    print(plan.toJson());
    tecDestination.clear();
    tecBudget.clear();
    tecDurationSDate.clear();
    tecDurationEDate.clear();
  }

  void removeMember(Member member) {
    members.remove(member);
  }

  void removePlan(PlanModel plan) {
    plans.remove(plan);
  }

  Future<void> selectDate(BuildContext context,
      {required bool isStartDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Earliest date
      lastDate: DateTime(2100), // Latest date
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: AppTheme.blackColor, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  iconColor: AppTheme.primaryColor), // Button color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      if (isStartDate) {
        tecDurationSDate.text = formattedDate;
      } else {
        tecDurationEDate.text = formattedDate;
      }
    }
  }

  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
