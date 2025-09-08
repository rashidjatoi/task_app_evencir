import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_icons.dart';
import '/core/utils/app_routes.dart';
import '../../core/utils/utils.dart';
import '../../controllers/favorite_controller.dart';
import '/core/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ph,
            Center(
              child: Text(
                "Favourites",
                style: TextStyle( fontSize:  24.sp, fontWeight:  6.weight),
              ),
            ),
            20.ph,
            CustomSearchFieldWidget(
              prefix: Icon(Icons.search).paddingOnly(left: 10, right: 5),
              prefixConstraints: BoxConstraints(),
              controller: controller.textSearch,
              hintText: 'Search here...',
              onChanged: (value) => controller.searchQuery.value = value,
            ),
            10.ph,
            Obx(() {
              final query = controller.searchQuery.value.toLowerCase();

              final filteredProducts =
                  controller.favoriteProducts.where((product) {
                return product.title.toLowerCase().contains(query);
              }).toList();
              return Text(
                "${filteredProducts.length} results found",
                style:TextStyle(
                fontSize:   10.sp,
                 fontWeight:  4.weight,
                 color: AppColors.primaryColor.withValues(alpha: 0.25),
                ),
              );
            }),
            20.ph,
            Expanded(
              child: Obx(() {
                final query = controller.searchQuery.value.toLowerCase();

                final filteredProducts =
                    controller.favoriteProducts.where((product) {
                  return product.title.toLowerCase().contains(query);
                }).toList();
                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final favoriteProduct = filteredProducts[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.productDetails,
                            arguments: favoriteProduct,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 14,
                          ),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                              left: BorderSide(
                                color: AppColors.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                              right: BorderSide(
                                color: AppColors.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 62.w,
                                height: 62.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      favoriteProduct.thumbnail,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              15.pw,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      favoriteProduct.title,
                                      style: TextStyle(
                                    fontSize:     14.sp,
                                       fontWeight:  6.weight,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$${favoriteProduct.price}",
                                    style: TextStyle(
                                   fontSize:    11.sp,
                                   fontWeight:    6.weight,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        favoriteProduct.rating.toString(),
                                        style: TextStyle(
                                         fontSize:  10.sp,
                                        fontWeight:   6.weight,
                                        ),
                                      ),
                                      5.pw,
                                      RatingBar.builder(
                                        initialRating: favoriteProduct.rating,
                                        minRating: 1,
                                        ignoreGestures: true,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 11.h,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  controller.toggleFavorite(favoriteProduct);
                                },
                                child: SvgPicture.asset(
                                  AppIcons.favoriteProductIcon,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
