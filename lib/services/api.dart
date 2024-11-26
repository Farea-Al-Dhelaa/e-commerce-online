
import 'dart:convert';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> getAllFromDb(String category) async {
    final String url = category.isEmpty || category == 'all'
        ? 'https://fakestoreapi.com/products'
        : 'https://fakestoreapi.com/products/category/$category';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
