import '../../views/navbar/navbar.dart';
import '../../views/categories/category_products.dart';
import '../../views/products/product_details.dart';
import '../../views/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashView = "/";
  static String bottomNavBar = "/Bottom_Nav_Bar";
  static String categoryProducts = "/Category_Products";
  static String productDetails = "/Product_Details";

  static List<GetPage> routes = [
    GetPage(
      name: splashView,
      page: () => SplashView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: bottomNavBar,
      page: () => BottomNavBar(),
      transition: Transition.fade,
    ),
    GetPage(
      name: categoryProducts,
      page: () => CategoryProducts(),
      transition: Transition.fade,
    ),
    GetPage(
      name: productDetails,
      page: () => ProductDetails(),
      transition: Transition.fade,
    ),
  ];
}
