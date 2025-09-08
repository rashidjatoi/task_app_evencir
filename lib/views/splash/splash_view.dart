import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_images.dart';
import '../../core/utils/text_constants/text_constants.dart';
import '../../core/utils/utils.dart';
import '../../controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Container(
        decoration: _buildBackground(),
        child: _buildContent(),
      ),
    );
  }

  // Background decoration
  BoxDecoration _buildBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppImages.splashBg),
        fit: BoxFit.cover,
      ),
    );
  }

  // Main content column
  Widget _buildContent() {
    return Column(
      children: [
        60.ph,
        _buildTitle(),
        Spacer(),
        _buildWelcomeText(),
        10.ph,
        _buildDescription(),
        130.ph,
      ],
    ).paddingSymmetric(horizontal: 40);
  }

  // App title
  Widget _buildTitle() {
    return Text(
      kSplashLogoText,
      style: TextStyle(
        fontSize: 50.sp,
        fontWeight: 4.weight,
      ),
    );
  }

  // Welcome message
  Widget _buildWelcomeText() {
    return Text(
      kSplashTitleText,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: 6.weight,
        color: AppColors.whiteColor,
      ),
    );
  }

  // Description text
  Widget _buildDescription() {
    return Text(
      ksplashDescriptionText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: 4.weight,
        color: AppColors.whiteColor,
      ),
    );
  }
}
