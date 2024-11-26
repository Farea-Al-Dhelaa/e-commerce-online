import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorites_provider.dart';
import '../../utils/constants.dart';
import '../../widgets/Product_card_view.dart';
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.black),

        ),
        backgroundColor: kcontentColor,
      elevation: 0.0,
      ),
      body: favoritesProvider.favoriteItems.isEmpty
          ? const Center(child: Text("No favorite products"))
          : ListView.builder(
        itemCount: favoritesProvider.favoriteItems.length,
        itemBuilder: (context, index) {
          final product = favoritesProvider.favoriteItems[index];
          return Dismissible(
            key: Key(
                product.id.toString()), // Unique key based on product ID
            direction:
            DismissDirection.endToStart, // Swipe from right to left
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              favoritesProvider.removeProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                  Text('${product.title} removed from favorites'),
                ),
              );
            },
            child: ProductCardView(product: product),
          );
        },
      ),
    );
  }
}
