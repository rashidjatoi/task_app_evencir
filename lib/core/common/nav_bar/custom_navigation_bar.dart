import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_icons.dart';
import 'custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: AppColors.primaryColor.withOpacity(0.05),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomNavigationBarItem(
                label: 'Products',
                index: 0,
                icon: AppIcons.productIcon,
              ),
            ),
            Expanded(
              child: CustomNavigationBarItem(
                label: 'Categories',
                index: 1,
                icon: AppIcons.categoryIcon,
              ),
            ),
            Expanded(
              child: CustomNavigationBarItem(
                label: 'Favorites',
                index: 2,
                icon: AppIcons.favoriteIcon,
              ),
            ),
            Expanded(
              child: CustomNavigationBarItem(
                label: 'Mitt konto',
                index: 3,
                icon: AppIcons.personIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
