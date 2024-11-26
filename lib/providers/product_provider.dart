import 'package:flutter/cupertino.dart';
import '../main.dart';
import '../models/product_model.dart';
import '../services/api.dart';
class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _loading = false;
  String _error = '';

  List<ProductModel> get products => _products;
  bool get loading => _loading;
  String get error => _error;

  Future<void> fetchProducts(String category) async {
    _loading = true;
    _error = '';
    notifyListeners();

    try {
      final products = await ProductRepository().getAllFromDb(category);
      _products = products;
    } catch (error) {
      _error = error.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
