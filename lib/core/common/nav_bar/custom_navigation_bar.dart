import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_icons.dart';
import 'custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildNavigationBar();
  }
  Widget _buildNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.zero,
        decoration: _buildDecoration(),
        child: _buildNavigationItems(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.primaryColor,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 0),
          color: AppColors.primaryColor.withValues(alpha: 0.05),
          blurRadius: 4,
        ),
      ],
    );
  }

  Widget _buildNavigationItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavItem('Products', 0, AppIcons.productIcon),
        _buildNavItem('Categories', 1, AppIcons.categoryIcon),
        _buildNavItem('Favorites', 2, AppIcons.favoriteIcon),
        _buildNavItem('Mitt konto', 3, AppIcons.personIcon),
      ],
    );
  }

  Widget _buildNavItem(String label, int index, String icon) {
    return Expanded(
      child: CustomNavigationBarItem(
        label: label,
        index: index,
        icon: icon,
      ),
    );
  }
}
