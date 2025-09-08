import '../../controllers/categories_controller.dart';
import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/images/app_images.dart';
import '../../core/utils/route/route_constants.dart';
import '../../core/utils/utils.dart';
import '/core/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());

    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoadingProducts.value,
        child: Scaffold(
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
                _buildResultsCount(controller),
                20.ph,
                _buildCategoryGrid(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        "Categories",
        style: TextStyle(fontSize: 24.sp, fontWeight: 6.weight),
      ),
    );
  }

  Widget _buildSearchField(CategoriesController controller) {
    return CustomSearchFieldWidget(
      prefix: Icon(Icons.search).paddingOnly(left: 10, right: 5),
      prefixConstraints: const BoxConstraints(),
      controller: controller.textSearch,
      hintText: 'Search here...',
      onChanged: (value) => controller.searchQuery.value = value,
    );
  }

  Widget _buildResultsCount(CategoriesController controller) {
    return Obx(() {
      final query = controller.searchQuery.value.toLowerCase();
      final filteredCategories = controller.productCategories.where((category) {
        return category.name.toLowerCase().contains(query);
      }).toList();

      return Text(
        "${filteredCategories.length} results found",
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: 4.weight,
          color: AppColors.primaryColor.withValues(alpha: 0.25),
        ),
      );
    });
  }

  Widget _buildCategoryGrid(CategoriesController controller) {
    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final query = controller.searchQuery.value.toLowerCase();
        final filteredCategories = controller.productCategories.where((
          category,
        ) {
          return category.name.toLowerCase().contains(query);
        }).toList();

        return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 20,
            childAspectRatio: 1.15,
          ),
          itemCount: filteredCategories.length,
          itemBuilder: (context, index) {
            final category = filteredCategories[index];
            return _buildCategoryItem(controller, category);
          },
        );
      }),
    );
  }

  Widget _buildCategoryItem(CategoriesController controller, dynamic category) {
    return InkWell(
      onTap: () async {
        await controller.fetchCategoryProducts(category.url);
        controller.selectedCategoryName = category.name;
        Get.toNamed(kCategoryProducts);
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AppImages.categoryImage, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 25.h,
            left: 15.w,
            child: Text(
              category.name,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: 6.weight,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
