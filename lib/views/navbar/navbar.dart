import '../../core/common/nav_bar/custom_navigation_bar.dart';
import '../../controllers/navbar_controller.dart';
import '../categories/categories_view.dart';
import '../favorites/favorite_products.dart';
import '../products/products_view.dart';
import '../profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final controller = Get.put(BottomBarController(), permanent: true);

  final _tabs = [
    ProductsView(),
    CategoriesView(),
    FavoriteProducts(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Scaffold(
        body: Obx(() {
          return _tabs[controller.tabIndex.value];
        }),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
