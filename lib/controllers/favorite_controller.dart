import '/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final textSearch = TextEditingController();

  var favoriteProducts = <ProductItemModel>[].obs;
  RxString searchQuery = ''.obs;

  void toggleFavorite(ProductItemModel product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
  }

  bool isFavorite(ProductItemModel product) {
    return favoriteProducts.contains(product);
  }
}
