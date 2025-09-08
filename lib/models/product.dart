class ProductItemModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final String brand;
  final int stock;
  final String thumbnail;
  final List<String> images;

  ProductItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.brand,
    required this.stock,
    required this.thumbnail,
    required this.images,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      brand: json['brand'] ?? '',
      stock: json['stock'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'rating': rating,
      'brand': brand,
      'stock': stock,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}
