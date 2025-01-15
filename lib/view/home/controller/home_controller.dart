import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehaal/models/plan_model.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
 RxList<PlanModel> plans = <PlanModel>[].obs;
  RxList<Member> members = <Member>[].obs;
  RxList<Activity> activities = <Activity>[].obs;
  void removePlan(PlanModel plan) {
    plans.remove(plan);
  }
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2), // Duration for one full rotation
      vsync: this,
    )..repeat(); // Repeats indefinitely
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
