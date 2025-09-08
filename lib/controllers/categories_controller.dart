import '/models/category.dart';
import '/models/product.dart';
import '../services/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final textSearch = TextEditingController();
  final textSearchProducts = TextEditingController();
  final ProductServices _productRepository = ProductServices();

  RxList<CategoryModel> productCategories = <CategoryModel>[].obs;
  RxList<ProductItemModel> categoryProducts = <ProductItemModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingProducts = false.obs;
  String selectedCategoryName = '';
  RxString searchQuery = ''.obs;
  RxString searchProductsQuery = ''.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }


// fetch categorries
  Future<void> fetchCategories() async {
    isLoading.value = true;

    final either = await _productRepository.fetchCategories();
    either.fold((err) {}, (categpriesData) {
      productCategories.assignAll(categpriesData);
    });
    isLoading.value = false;
  }


// Fetch category products
  Future<void> fetchCategoryProducts(String categoryUrl) async {
    isLoadingProducts.value = true;
    final either =
        await _productRepository.fetchProductsPerCategory(catUrl: categoryUrl);
    either.fold((err) {}, (data) {
      categoryProducts.assignAll(data);
    });
    isLoadingProducts.value = false;
  }
}
