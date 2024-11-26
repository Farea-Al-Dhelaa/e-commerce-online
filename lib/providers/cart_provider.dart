import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';
class CartProvider with ChangeNotifier {
  List<ProductModel> cartItems = [];

  void addToCart(ProductModel product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
    notifyListeners();
  }
  int get cartItemCount => cartItems.length;
//decrementQuantity(ProductModel product) {}

//int? getItemQuantity(ProductModel product) {}
}


