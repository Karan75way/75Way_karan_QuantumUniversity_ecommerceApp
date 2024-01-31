class ProductModel {
  final int id;
  final String name;
  final String brand;
  final double price;
  final String description;
  final String category;
  final int stock;
  final double rating;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.category,
    required this.stock,
    required this.rating,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      stock: json['stock'],
      rating: json['rating'],
      imageUrl: json['image_url'],
    );
  }
}
