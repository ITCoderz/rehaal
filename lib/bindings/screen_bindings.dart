import 'package:get/get.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';
import 'package:rehaal/view/splash/controller/splash_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthController());
  }
}
