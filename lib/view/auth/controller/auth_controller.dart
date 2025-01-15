import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rehaal/utils/app_theme.dart';

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

  final GlobalKey<FormState> createAccountKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
      tecDobS.text =
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    }
  }
}
