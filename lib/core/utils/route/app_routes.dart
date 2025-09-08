import '../../../views/navbar/navbar.dart';
import '../../../views/categories/category_products.dart';
import '../../../views/products/product_details.dart';
import '../../../views/splash/splash_view.dart';
import 'package:get/get.dart';

import 'route_constants.dart';

class AppRoutes {


  static List<GetPage> routes = [
    GetPage(
      name: kSplashView,
      page: () => SplashView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: kBottomNavBar,
      page: () => BottomNavBar(),
      transition: Transition.fade,
    ),
    GetPage(
      name: kCategoryProducts,
      page: () => CategoryProducts(),
      transition: Transition.fade,
    ),
    GetPage(
      name: kProductDetails,
      page: () => ProductDetails(),
      transition: Transition.fade,
    ),
  ];
}
