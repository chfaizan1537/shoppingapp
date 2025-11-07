import 'package:shoppingapp/model/productmodel.dart';

class CartModel {
  static List<Products> cartItems = [];

  static void addToCart(Products product) {
    cartItems.add(product);
  }

  static void removeFromCart(Products product) {
    cartItems.remove(product);
  }

  static List<Products> getCartItems() {
    return cartItems;
  }
}
