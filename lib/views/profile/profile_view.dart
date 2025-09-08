import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_icons.dart';
import '../../core/utils/text_constants/text_constants.dart';
import '../../core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.ph,
            _buildHeader(),
            34.ph,
            _buildUserCard(),
            60.ph,
            _buildOptionRows(),
          ],
        ),
      ),
    );
  }

  // Header title
  Widget _buildHeader() {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24.sp, fontWeight: 6.weight),
      ),
    );
  }

  // User information card
  Widget _buildUserCard() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          _buildUserAvatar(),
          15.pw,
          _buildUserInfo(),
        ],
      ),
    );
  }

  // Circular avatar
  Widget _buildUserAvatar() {
    return Container(
      width: 62.w,
      height: 62.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.selectbottomBarColor,
      ),
    );
  }

  // User name, email, phone
  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserText(name, 14.sp, 6.weight, AppColors.whiteColor),
        _buildUserText(email, 10.sp, 4.weight, AppColors.whiteColor),
        _buildUserText(phone, 10.sp, 4.weight, AppColors.whiteColor),
      ],
    );
  }

  // Text widget helper
  Widget _buildUserText(String text, double fontSize, FontWeight weight, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: weight, color: color),
    );
  }

  // All profile options
  Widget _buildOptionRows() {
    return Column(
      children: [
        _buildProfileOptionRow(AppIcons.settingsIcon, accountSettings),
        25.ph,
        _buildProfileOptionRow(AppIcons.orderIcon, paymentMethods),
        25.ph,
        _buildProfileOptionRow(AppIcons.supportIcon, support),
      ],
    );
  }

  // Individual profile option row
  Widget _buildProfileOptionRow(String iconPath, String title) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        20.pw,
        Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: 4.weight)),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
