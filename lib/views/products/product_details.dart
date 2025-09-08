import 'package:cached_network_image/cached_network_image.dart';
import '/models/product.dart';
import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_icons.dart';

import '../../core/utils/utils.dart';
import '../../controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductItemModel;
    final controller = Get.find<FavoriteController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Product Details",
                    style: TextStyle( fontSize:  24.sp,  fontWeight:  6.weight),
                  ),
                  Spacer(),
                ],
              ).paddingSymmetric(horizontal: 20),
              10.ph,
              Center(
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Details:",
                          style: TextStyle( fontSize:  18.sp,fontWeight:  6.weight),
                        ),
                        Obx(() {
                          return InkWell(
                            onTap: () {
                              controller.toggleFavorite(product);
                            },
                            child: SvgPicture.asset(
                              controller.isFavorite(product)
                                  ? AppIcons.favoriteProductIcon
                                  : AppIcons.notFavoriteIcon,
                              width: 30,
                            ),
                          );
                        }),
                      ],
                    ),
                    9.ph,
                    _buildProductDetailRow(
                      title: 'Name:',
                      value: product.title,
                    ),
                    9.ph,
                    _buildProductDetailRow(
                      title: 'Price:',
                      value: '\$${product.title}',
                    ),
                    9.ph,
                    _buildProductDetailRow(
                      title: 'Category:',
                      value: product.title,
                    ),
                    9.ph,
                    _buildProductDetailRow(
                      title: 'Brand:',
                      value: product.brand,
                    ),
                    9.ph,
                    Row(
                      children: [
                        Text(
                          'Rating:',
                          style:TextStyle( fontSize:  12.sp, fontWeight:  6.weight),
                        ),
                        10.pw,
                        Row(
                          children: [
                            Text(
                              product.rating.toString(),
                              style: TextStyle(  fontSize:  10.sp, fontWeight:   6.weight),
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
                      ],
                    ),
                    9.ph,
                    _buildProductDetailRow(
                      title: 'Stock:',
                      value: product.stock.toString(),
                    ),
                    9.ph,
                    Text(
                      'Description:',
                      style: TextStyle( fontSize:  12.sp, fontWeight:   6.weight),
                    ),
                    Text(
                      product.description,
                      style:TextStyle( fontSize:  10.sp, fontWeight:  4.weight),
                    ),
                    9.ph,
                    Text(
                      'Product Gallery:',
                      style: TextStyle(  fontSize:  12.sp,  fontWeight:  6.weight),
                    ),
                    5.ph,
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: product.images.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: product.images[index],
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailRow({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Text(title, style:TextStyle(fontSize:  12.sp, fontWeight:  6.weight)),
        10.pw,
        Text(value, style: TextStyle(fontSize: 10.sp, fontWeight:  4.weight)),
      ],
    );
  }
}
