import 'package:get/get.dart';

import '../../controller/bottom_nav_controller.dart';


class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
   
  }
}
