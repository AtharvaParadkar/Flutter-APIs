class ProductsModel {
  final int id;
  final double price;
  final String title, description, category, imageUrl;
  final Map<String, dynamic> rating;

  ProductsModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price: (json['price'] as num).toDouble(),
      title: json['title'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
      rating: json['rating'],
    );
  }
}
