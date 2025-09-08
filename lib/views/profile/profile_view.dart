import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_icons.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.ph,
            Center(
              child: Text(
                "Mitt konto",
                style: TextStyle(  fontSize:  24.sp, fontWeight:   6.weight),
              ),
            ),
            34.ph,
            Container(
              width: Get.width,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    width: 62.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.selectbottomBarColor,
                    ),
                  ),
                  15.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Samama Majeed",
                        style:TextStyle(fontSize: 
                          14.sp,
                       fontWeight:    6.weight,
                        color:  AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        "samama@gmail.com",
                        style: TextStyle(
                        fontSize:  10.sp,
                         fontWeight: 4.weight,
                       color:   AppColors.whiteColor,
                        ),
                      ),
                      Text(
                        "07XXXXXXXX",
                        style: TextStyle(
                          fontSize: 
                          10.sp,
                         fontWeight:  4.weight,
                       color:   AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            60.ph,
            _buildProfileOptionRow(
              iconPath: AppIcons.settingsIcon,
              title: 'Kontoinstallningar',
            ),
            25.ph,
            _buildProfileOptionRow(
              iconPath: AppIcons.orderIcon,
              title: 'Mina betalmetoder',
            ),
            25.ph,
            _buildProfileOptionRow(
              iconPath: AppIcons.supportIcon,
              title: 'Support',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOptionRow({
    required String iconPath,
    required String title,
  }) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        20.pw,
        Text(title, style: TextStyle(fontSize:   14.sp,fontWeight:   4.weight)),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
