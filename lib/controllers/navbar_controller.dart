import '../core/utils/logger.dart';
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
    AppLogger.info("Initial tab index: ${tabIndex.value}");
  }
}
