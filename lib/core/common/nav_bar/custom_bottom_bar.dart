import '../../utils/colors/app_colors.dart';
import '../../utils/utils.dart';
import '../../../controllers/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class CustomNavigationBarItem extends StatelessWidget {
  String? label;
  int? index;
  String? icon;

  CustomNavigationBarItem({super.key, this.label, this.index, this.icon});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomBarController>();

    return InkWell(
      onTap: () {
        if (controller.tabIndex.value != index) {
          controller.changeTabIndex(index!);
        }
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: controller.tabIndex.value == index
                ? AppColors.selectbottomBarColor.withValues(alpha: 0.05)
                : AppColors.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              10.ph,
              SvgPicture.asset(icon!, height: 25, color: AppColors.whiteColor),
              Text(
                label.toString(),
                style: TextStyle(
                fontSize:   10.sp,
                 fontWeight:  4.weight,
                color:  AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
