import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../core/bindings/screen_bindings.dart';
import 'core/utils/colors/app_colors.dart';
import 'core/utils/route/app_routes.dart';
import 'core/utils/route/route_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScreenUtilInit();
  }

  Widget _buildScreenUtilInit() {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) => _buildGetMaterialApp(),
    );
  }

  Widget _buildGetMaterialApp() {
    return GetMaterialApp(
      title: 'Ecommerce App',
      initialBinding: ScreenBindings(),
      initialRoute: kSplashView,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
      ),
    );
  }
}
