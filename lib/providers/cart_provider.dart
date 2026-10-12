import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final String image;
  final String name;
  final String price;
  final String oldPrice;
  final String color;
  final String discount;
  int quantity;
  bool isFavorite;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.color,
    required this.discount,
    this.quantity = 1,
    this.isFavorite = false,
  });
}

class CartNotifier extends Notifier<List<CartItem>> {
  final Set<String> _favoriteProducts = {};

  @override
  List<CartItem> build() {
    return [];
  }

  // Check favorite status by product name
  bool isFavorite(String productName) {
    return _favoriteProducts.contains(productName);
  }

  // Toggle favorite from Product Details
  void toggleFavoriteByName(String productName) {
    if (_favoriteProducts.contains(productName)) {
      _favoriteProducts.remove(productName);
    } else {
      _favoriteProducts.add(productName);
    }

    final index = state.indexWhere(
          (product) => product.name == productName,
    );

    if (index != -1) {
      final updatedList = [...state];

      updatedList[index].isFavorite =
          _favoriteProducts.contains(productName);

      state = updatedList;
    } else {
      // Notify Product Details to rebuild
      state = [...state];
    }
  }

  // Add product to cart
  void addToCart(CartItem item) {
    final existingIndex = state.indexWhere(
          (product) => product.name == item.name,
    );

    if (existingIndex != -1) {
      final updatedList = [...state];

      updatedList[existingIndex].quantity += item.quantity;

      state = updatedList;
    } else {
      item.isFavorite = _favoriteProducts.contains(item.name);

      state = [...state, item];
    }
  }

  // Increase quantity
  void increaseQuantity(int index) {
    final updatedList = [...state];

    updatedList[index].quantity++;

    state = updatedList;
  }

  // Decrease quantity
  void decreaseQuantity(int index) {
    final updatedList = [...state];

    if (updatedList[index].quantity > 1) {
      updatedList[index].quantity--;
    }

    state = updatedList;
  }

  // Favorite from Cart
  void toggleFavorite(int index) {
    final updatedList = [...state];
    final productName = updatedList[index].name;

    if (_favoriteProducts.contains(productName)) {
      _favoriteProducts.remove(productName);
    } else {
      _favoriteProducts.add(productName);
    }

    updatedList[index].isFavorite =
        _favoriteProducts.contains(productName);

    state = updatedList;
  }
}

final cartProvider =
NotifierProvider<CartNotifier, List<CartItem>>(
  CartNotifier.new,
);
