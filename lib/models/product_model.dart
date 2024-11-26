
class ProductModel {
  final int id;
  final String? title;
  final double? price;
  final String? category;
  final String? image;
  final String? description;

  ProductModel(
      {required this.id,
        this.description,
        this.title,
        this.price,
        this.category,
        this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['title'],
      price: json['price']?.toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }
}
