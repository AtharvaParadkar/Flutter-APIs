class ProductsModel {
  final int id;
  final double price;
  final String title, description, category, imageUrl;
  final Rating rating;

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
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }
}
