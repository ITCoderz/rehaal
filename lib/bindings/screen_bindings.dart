import 'package:get/get.dart';
import 'package:rehaal/view/ai_assistant/controller/ai_assistant_controller.dart';
import 'package:rehaal/view/auth/controller/auth_controller.dart';
import 'package:rehaal/view/home/controller/home_controller.dart';
import 'package:rehaal/view/plans/controller/plans_controller.dart';
import 'package:rehaal/view/splash/controller/splash_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => PlansController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AiAssistantController());
  }
}
