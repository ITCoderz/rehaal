import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

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
