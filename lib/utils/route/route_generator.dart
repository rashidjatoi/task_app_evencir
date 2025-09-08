import 'package:get/get.dart';
import 'package:task_app/views/nav_bar/nav_bar_screen.dart';

import '../bindings/screen_binding.dart';
import '../screen_constants/constants.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kBottomNavBarRoute,
        page: () => const BottomNavBarView(),
        binding: ScreenBindings(),
      ),
    ];
  }
}
