import 'package:get/get.dart';
import 'package:rehaal/utils/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.welcomeView);
    });
  }
}
