import '/models/product.dart';
import '../services/product_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final textSearch = TextEditingController();
  RxList<ProductItemModel> productsItems = <ProductItemModel>[].obs;
  RxBool isLoading = false.obs;
  RxString searchQuery = ''.obs;
  final ProductServices _productRepository = ProductServices();
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    final result  = await _productRepository.fetchProducts();
    result .fold((err) {}, (productsList) {
      productsItems.assignAll(productsList);
    });
    isLoading.value = false;
  }
}
