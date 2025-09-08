import '/core/utils/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(AppRoutes.bottomNavBar);
  }

  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }
}
