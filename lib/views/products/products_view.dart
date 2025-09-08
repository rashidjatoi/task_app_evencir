import '../../core/utils/colors/app_colors.dart';
import '../../core/utils/route/route_constants.dart';
import '../../core/utils/utils.dart';
import '../../core/common/product_widget.dart';
import '../../controllers/products_controller.dart';
import '/core/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());

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
            _buildResultsCount(controller),
            20.ph,
            _buildProductList(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        "Products",
        style: TextStyle(fontSize: 24.sp, fontWeight: 6.weight),
      ),
    );
  }

  Widget _buildSearchField(ProductsController controller) {
    return CustomSearchFieldWidget(
      prefix: Icon(Icons.search).paddingOnly(left: 10, right: 5),
      prefixConstraints: const BoxConstraints(),
      controller: controller.textSearch,
      onChanged: (value) => controller.searchQuery.value = value,
      hintText: 'Search here...',
    );
  }

  Widget _buildResultsCount(ProductsController controller) {
    return Obx(() {
      final query = controller.searchQuery.value.toLowerCase();
      final filteredProducts = controller.productsItems.where((product) {
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

  Widget _buildProductList(ProductsController controller) {
    return Expanded(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final query = controller.searchQuery.value.toLowerCase();
        final filteredProducts = controller.productsItems.where((product) {
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
                onTap: () => Get.toNamed(
                  kProductDetails,
                  arguments: product,
                ),
                child: ProductWidget(product: product),
              ),
            );
          },
        );
      }),
    );
  }
}
