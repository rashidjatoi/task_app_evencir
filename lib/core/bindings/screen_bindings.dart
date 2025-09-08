import '../../controllers/categories_controller.dart';
import '../../controllers/navbar_controller.dart';
import '../../controllers/favorite_controller.dart';
import '../../controllers/products_controller.dart';
import '../../controllers/splash_controller.dart';
import 'package:get/get.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => ProductsController());
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut(() =>FavoriteController());
  }
}
