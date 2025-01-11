import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final fnEmailL = FocusNode();
  final fnResetEmail = FocusNode();
  final fnResetPassord = FocusNode();
  final fnResetCPassword = FocusNode();
  final fnPasswordL = FocusNode();
  final fnEmailS = FocusNode();
  final fnPasswordS = FocusNode();
  final fnCPasswordS = FocusNode();
  final fnDobS = FocusNode();
  final fnNameS = FocusNode();

  final tecEmailL = TextEditingController();
  final tecResetEmail = TextEditingController();
  final tecPasswordL = TextEditingController();
  final tecEmailS = TextEditingController();
  final tecPasswordS = TextEditingController();
  final tecCPasswordS = TextEditingController();
  final tecDobS = TextEditingController();
  final tecNameS = TextEditingController();
  final tecResetPassword = TextEditingController();
  final tecResetPasswordC = TextEditingController();
  RxBool isCheck = false.obs;
}
