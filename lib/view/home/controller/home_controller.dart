import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehaal/models/plan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  RxList<PlanModel> plans = <PlanModel>[].obs;
  RxList<Member> members = <Member>[].obs;
  RxList<Activity> activities = <Activity>[].obs;
  void removePlan(PlanModel plan) {
    plans.remove(plan);
    savePlansToStorage();
  }

  Future<void> loadPlansFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? plansString = prefs.getString('plans');

      print(
          "Raw data from SharedPreferences: $plansString"); // Debug the raw data

      if (plansString != null) {
        final List<dynamic> plansList = await jsonDecode(plansString);
        print("Decoded plans list: $plansList"); // Debug decoded JSON

        plans.value =
            plansList.map((json) => PlanModel.fromJson(json)).toList();
        print("Loaded plans: ${plans}");
      } else {
        print("No plans found in SharedPreferences.");
      }
    } catch (e, stackTrace) {
      print("Error loading plans: $e");
      print("Stack trace: $stackTrace");
    }
  }

  Future<void> savePlansToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Convert plans to JSON
      final plansJson = plans.map((plan) => plan.toJson()).toList();
      print("Plans to save: $plansJson");

      // Save to SharedPreferences
      await prefs.setString('plans', jsonEncode(plansJson));
      print("Plans saved to SharedPreferences");

      // Load plans again to confirm
      await loadPlansFromStorage();
      print('Plans saved and reloaded successfully!');
    } catch (e, stackTrace) {
      print('Error saving plans: $e');
      print('Stack trace: $stackTrace');
    }
  }

  @override
  void onInit() {
    loadPlansFromStorage();
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
