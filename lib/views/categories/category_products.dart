import '../../controllers/categories_controller.dart';
import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/route/route_constants.dart';
import '../../core/utils/utils.dart';
import '../../core/common/product_widget.dart';
import '/core/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoriesController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              _buildHeader(controller),
              20.ph,
              _buildSearchField(controller),
              10.ph,
              _buildResultsCount(controller),
              20.ph,
              _buildProductsList(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(CategoriesController controller) {
    return Row(
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: AppColors.primaryColor),
        ),
        Spacer(),
        Text(
          controller.selectedCategoryName,
          style: TextStyle(fontSize: 24.sp, fontWeight: 6.weight),
        ),
        Spacer(),
      ],
    );
  }

  Widget _buildSearchField(CategoriesController controller) {
    return CustomSearchFieldWidget(
      prefix: Icon(Icons.search).paddingOnly(left: 10, right: 5),
      prefixConstraints: const BoxConstraints(),
      controller: controller.textSearchProducts,
      hintText: 'Search here...',
      onChanged: (value) => controller.searchProductsQuery.value = value,
    );
  }

  Widget _buildResultsCount(CategoriesController controller) {
    return Obx(() {
      final query = controller.searchProductsQuery.value.toLowerCase();
      final filteredProducts = controller.categoryProducts.where((product) {
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

  Widget _buildProductsList(CategoriesController controller) {
    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final query = controller.searchProductsQuery.value.toLowerCase();
        final filteredProducts = controller.categoryProducts.where((product) {
          return product.title.toLowerCase().contains(query);
        }).toList();

        return ListView.builder(
          itemCount: filteredProducts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    kProductDetails,
                    arguments: product,
                  );
                },
                child: ProductWidget(product: product),
              ),
            );
          },
        );
      }),
    );
  }
}
