import '../../utils/colors/app_colors.dart';
import '../../utils/utils.dart';
import '../../../controllers/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomNavigationBarItem extends StatelessWidget {
  final String? label;
  final int? index;
  final String? icon;

  const CustomNavigationBarItem({super.key, this.label, this.index, this.icon});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomBarController>();

    return InkWell(
      onTap: () => _onTap(controller),
      child: Obx(
        () => _buildContainer(controller),
      ),
    );
  }

  void _onTap(BottomBarController controller) {
    if (controller.tabIndex.value != index) {
      controller.changeTabIndex(index!);
    }
  }

  Widget _buildContainer(BottomBarController controller) {
    return Container(
      decoration: _buildDecoration(controller),
      child: _buildColumn(),
    );
  }

  BoxDecoration _buildDecoration(BottomBarController controller) {
    return BoxDecoration(
      color: controller.tabIndex.value == index
          ? AppColors.selectbottomBarColor.withValues(alpha: 0.05)
          : AppColors.primaryColor,
    );
  }

  Widget _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        10.ph,
        _buildIcon(),
        _buildLabel(),
      ],
    );
  }

  Widget _buildIcon() {
    return SvgPicture.asset(
      icon!,
      height: 25,
      colorFilter: const ColorFilter.mode(
        AppColors.whiteColor,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      label.toString(),
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: 4.weight,
        color: AppColors.whiteColor,
      ),
    );
  }
}
