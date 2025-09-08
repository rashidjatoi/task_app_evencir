import 'package:get/get.dart';
import '../core/utils/route/route_constants.dart' show kBottomNavBar;


class SplashController extends GetxController {
  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(kBottomNavBar);
  }

  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }
}
