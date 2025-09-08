import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/bindings/screen_binding.dart';
import 'utils/route/route_generator.dart';
import 'utils/screen_constants/constants.dart';
import 'views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      initialRoute: kSplashScreenRoute,
      initialBinding: ScreenBindings(),
      getPages: RouteGenerator.getPages(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashView(),
    );
  }
}