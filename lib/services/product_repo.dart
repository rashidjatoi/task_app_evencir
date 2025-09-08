import 'dart:convert';

import '../core/utils/logger.dart';
import '/models/category.dart';
import '/models/product.dart';
import 'api_contants.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class ProductServices with ApiConstants {
  Future<Either<String, List<ProductItemModel>>> fetchProducts() async {
    try {
      final response = await http.get(productsUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<ProductItemModel> fetchedProducts = (data['products'] as List)
            .map((item) => ProductItemModel.fromJson(item))
            .toList();
        return Right(fetchedProducts);
      } else {
        AppLogger.warn('Failed to load products: ${response.statusCode}');
        return Left('No products found.');
      }
    } catch (e) {
      AppLogger.error('Error fetching products: $e');
      return Left('No products found.');
    }
  }

  Future<Either<String, List<ProductItemModel>>> fetchProductsPerCategory(
      {required String catUrl}) async {
    try {
      final response = await http.get(Uri.parse(catUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<ProductItemModel> fetchedProducts = (data['products'] as List)
            .map((item) => ProductItemModel.fromJson(item))
            .toList();
        return Right(fetchedProducts);
      } else {
        AppLogger.warn('Failed to load products: ${response.statusCode}');
        return Left('No products found.');
      }
    } catch (e) {
      AppLogger.error('Error fetching products: $e');
      return Left('No products found.');
    }
  }

  Future<Either<String, List<CategoryModel>>> fetchCategories() async {
    List<CategoryModel> categories = List.empty();
    try {
      final response = await http.get(categoryUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        categories = data.map((e) => CategoryModel.fromJson(e)).toList();
        return Right(categories);
      } else {
        AppLogger.warn('Failed to load categories: ${response.statusCode}');
        return Left('No categories found.');
      }
    } catch (e) {
      AppLogger.error('Error fetching categories: $e');
      return Left('No categories found.');
    }
  }
}
