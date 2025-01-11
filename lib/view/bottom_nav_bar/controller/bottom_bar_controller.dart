import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
  RxBool isAppUnderMaintainace = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("Initial tab index: ${tabIndex.value}"); // Debugging line
  }
}
