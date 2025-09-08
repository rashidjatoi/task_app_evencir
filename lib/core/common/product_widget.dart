import 'package:cached_network_image/cached_network_image.dart';
import '/models/product.dart';
import '../utils/colors/app_colors.dart';
import '../utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final ProductItemModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
          left: BorderSide(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
          right: BorderSide(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: product.thumbnail,
              height: 177.h,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  product.title,
                  style: TextStyle( fontSize:  14.sp, fontWeight:  6.weight),
                ),
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(fontSize:   16.sp, fontWeight:  6.weight),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                product.rating.toString(),
                style: TextStyle( fontSize:  10.sp, fontWeight:   6.weight),
              ),
              5.pw,
              RatingBar.builder(
                initialRating: product.rating,
                minRating: 1,
                ignoreGestures: true,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 11.h,
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          5.ph,
          Text(
            product.brand,
            style:TextStyle(
           fontSize:    10.sp,
           fontWeight:    4.weight,
            color:  AppColors.primaryColor.withValues(alpha: 0.5),
            ),
          ),
          10.ph,
          Text(
            product.category,
            style:TextStyle(
            fontSize:   10.sp,
             fontWeight:  4.weight,
           color:    AppColors.primaryColor,
            ),
          ),
          17.ph,
        ],
      ),
    );
  }
}
