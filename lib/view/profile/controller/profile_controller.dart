import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehaal/utils/app_theme.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';

class ProfileController extends GetxController {
  final fnName = FocusNode();
  final fnEmail = FocusNode();
  final fnDob = FocusNode();
  final fnPasswod = FocusNode();

  final tecName = TextEditingController();
  final tecEmail = TextEditingController();
  final tecDob = TextEditingController();
  final tecPassword = TextEditingController();
  final authController = Get.put(AuthController());

  Rx<File?> selectedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> selectDOB(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: AppTheme.primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      tecDob.text =
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tecName.text = authController.tecNameS.text ?? '';
    tecEmail.text = authController.tecEmailL.text.isNotEmpty
        ? authController.tecEmailL.text
        : authController.tecEmailS.text ?? '';
    tecDob.text = authController.tecDobS.text ?? '';
    tecPassword.text = authController.tecPasswordL.text.isNotEmpty
        ? authController.tecPasswordL.text
        : authController.tecPasswordS.text ?? '';
  }
}
