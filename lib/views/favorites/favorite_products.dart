import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_icons.dart';
import '../../core/utils/route/route_constants.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ph,
            _buildHeader(),
            20.ph,
            _buildSearchField(controller),
            10.ph,
            _buildSearchResultsCount(controller),
            20.ph,
            _buildFavoriteList(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        "Favourites",
        style: TextStyle(fontSize: 24.sp, fontWeight: 6.weight),
      ),
    );
  }

  Widget _buildSearchField(FavoriteController controller) {
    return CustomSearchFieldWidget(
      prefix: Icon(Icons.search).paddingOnly(left: 10, right: 5),
      prefixConstraints: const BoxConstraints(),
      controller: controller.textSearch,
      hintText: 'Search here...',
      onChanged: (value) => controller.searchQuery.value = value,
    );
  }

  Widget _buildSearchResultsCount(FavoriteController controller) {
    return Obx(() {
      final query = controller.searchQuery.value.toLowerCase();
      final filteredProducts = controller.favoriteProducts.where((product) {
        return product.title.toLowerCase().contains(query);
      }).toList();

      return Text(
        "${filteredProducts.length} results found",
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: 4.weight,
          color: AppColors.primaryColor.withValues(alpha: 0.25),
        ),
      );
    });
  }

  Widget _buildFavoriteList(FavoriteController controller) {
    return Expanded(
      child: Obx(() {
        final query = controller.searchQuery.value.toLowerCase();
        final filteredProducts = controller.favoriteProducts.where((product) {
          return product.title.toLowerCase().contains(query);
        }).toList();

        return ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return _buildFavoriteItem(product, controller);
          },
        );
      }),
    );
  }

  Widget _buildFavoriteItem(product, FavoriteController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () => Get.toNamed(kProductDetails, arguments: product),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            border: Border(
              bottom: BorderSide(color: AppColors.primaryColor.withValues(alpha: 0.1)),
              left: BorderSide(color: AppColors.primaryColor.withValues(alpha: 0.1)),
              right: BorderSide(color: AppColors.primaryColor.withValues(alpha: 0.1)),
            ),
          ),
          child: Row(
            children: [
              _buildProductImage(product.thumbnail),
              15.pw,
              _buildProductInfo(product),
              const Spacer(),
              _buildFavoriteIcon(product, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(String url) {
    return Container(
      width: 62.w,
      height: 62.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductInfo(product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 180.w,
          child: Text(
            product.title,
            style: TextStyle(fontSize: 14.sp, fontWeight: 6.weight),
          ),
        ),
        Text(
          "\$${product.price}",
          style: TextStyle(fontSize: 11.sp, fontWeight: 6.weight),
        ),
        Row(
          children: [
            Text(
              product.rating.toString(),
              style: TextStyle(fontSize: 10.sp, fontWeight: 6.weight),
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
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFavoriteIcon(product, FavoriteController controller) {
    return InkWell(
      onTap: () => controller.toggleFavorite(product),
      child: SvgPicture.asset(AppIcons.favoriteProductIcon),
    );
  }
}
