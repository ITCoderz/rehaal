import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rehaal/models/plan_model.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/view/home/controller/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isView = false;

  RxBool isActivityAdded = false.obs;
  RxInt activeStep = 0.obs;
  final homeController = Get.find<HomeController>();

  RxBool isImageSelected = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null); // To hold the selected image

  final ImagePicker _picker = ImagePicker();
  var selectedImagePath = ''.obs;

  Future<void> selectActivityDate() async {
    // Show a date picker
    DateTime? pickedDate = await showDatePicker(
    
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      
    );

    if (pickedDate != null) {
      tecActivityDate.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  Future<void> selectImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      selectedImagePath.value = pickedFile.path;
      isImageSelected.value = true;
    } else {
      isImageSelected.value = false;
    }
  }

  void addMember(Member member) {
    homeController.members.add(member);
  }

  void addActivity(Activity activity) {
    homeController.activities.add(activity);
    tecActivityName.clear();
    tecActivityAmount.clear();
    tecActivityDate.clear();
  }

  void addPlan(PlanModel plan) {
    homeController.plans.add(plan);
    print(plan.toJson());
    print('Members before clearing: ${plan.members}'); // Debug members
    print('Activities before clearing: ${plan.activities}');
    tecDestination.clear();
    tecBudget.clear();
    tecDurationSDate.clear();
    tecDurationEDate.clear();

    isImageSelected.value = false;
    selectedImagePath.value = '';
    selectedImage.value = null;
  }

  Future<void> savePlansToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print("Number of plans before saving: ${homeController.plans.length}");

      final plansJson =
          homeController.plans.map((plan) => plan.toJson()).toList();
      print("Plans to save: $plansJson");

      await prefs.setString('plans', jsonEncode(plansJson));
      print(jsonEncode(plansJson));
      print("Plans saved to SharedPreferences");

      await homeController.loadPlansFromStorage();
      print('Plans saved and reloaded successfully!');
    } catch (e, stackTrace) {
      print('Error saving plans: $e');
      print('Stack trace: $stackTrace');
    }
  }

  void updatePlan(PlanModel updatedPlan) {
    int index = homeController.plans
        .indexWhere((plan) => plan.imagePath == updatedPlan.imagePath);

    // If plan exists, update it
    if (index != -1) {
      homeController.plans[index] = updatedPlan;
      print(updatedPlan.toJson());
      tecDestination.clear();
      tecBudget.clear();
      tecDurationSDate.clear();
      tecDurationEDate.clear();

      isImageSelected.value = false;
      selectedImagePath.value = '';
      selectedImage.value = null;
    } else {
      print('Plan not found');
    }
  }

  void removeMember(Member member) {
    homeController.members.remove(member);
  }

  void removePlan(PlanModel plan) {
    homeController.plans.remove(plan);
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
    print('AddNewPlanView initialized');
    final arguments = Get.arguments;
    print('Arguments: $arguments');

    if (arguments != null) {
      isView = arguments['isView'] ?? false;
      final planModel = arguments['planModel'] as PlanModel;
      tecDestination.text = planModel.destinationName;
      tecBudget.text = planModel.budget.toString();
      tecDurationSDate.text =
          "${DateFormat('d MMM').format(planModel.startDate)}";
      tecDurationEDate.text =
          "${DateFormat('d MMM').format(planModel.endDate)}";
      isImageSelected.value = true;
      selectedImagePath.value = planModel.imagePath!;
    }
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
