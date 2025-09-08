import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_nav_controller.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  final BottomNavController controller = Get.put(BottomNavController());

  // Dummy screens using Container
  final List<Widget> screens = [
    Container(
      color: Colors.red,
      child: Center(child: Text('Products')),
    ),
    Container(
      color: Colors.blue,
      child: Center(child: Text('Categories')),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text('Favourites')),
    ),
    Container(
      color: Colors.orange,
      child: Center(child: Text('Mi conto')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  _bottomNavBar() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          elevation: 0,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Mi conto',
            ),
          ],
        ),
      ),
    );
  }
}
