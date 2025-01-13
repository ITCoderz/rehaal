import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final fnName = FocusNode();
  final fnEmail = FocusNode();
  final fnDob = FocusNode();
  final fnPasswod = FocusNode();

  final tecName = TextEditingController();
  final tecEmail = TextEditingController();
  final tecDob = TextEditingController();
  final tecPassword = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tecName.text = 'Ali Altuwaijri';
    tecEmail.text = 'ali@gmail.com';
    tecDob.text = '21/01/2024';
    tecDob.text = '*******';
  }
}
