import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/screen_constants/constants.dart';




class SplashScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;


  @override
  void onInit() {
    _timer = Timer(const Duration(seconds: 3), () {
      _screenNavigation();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }



  void _screenNavigation() async {
    Get.offAllNamed(kBottomNavBarRoute);
  }

  void onScreenTap() {
    _timer.cancel();
    _screenNavigation();
  }

}
