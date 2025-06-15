import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    // [name, price, img, color]
    ['Bread', '5.49', 'assets/items/bread.png'],
    ['Milk', '6.25', 'assets/items/milk.png'],
    ['Croissant', '7.89', 'assets/items/croissant.png'],
    ['Frappe', '12.75', 'assets/items/frappe.png'],
    ['Latte', '11.40', 'assets/items/latte.png'],
    ['Cupcake', '8.30', 'assets/items/cupcake.png'],
    ['Donut', '6.95', 'assets/items/donut.png'],
    ['Strawberry Cake', '15.99', 'assets/items/strawberry-cake.png'],
    // ['Chocolate Pastry', '9.80', 'assets/items/chocolate-pastry.png'],
    ['Smoothie', '13.60', 'assets/items/smoothie.png'],
    ['Pancakes', '10.45', 'assets/items/pancakes.png'],
    ['Cookies', '7.15', 'assets/items/cookies.png'],

    // ['bread', '20', 'assets/items/.png', .],
    // ['bread', '20', 'assets/items/.png', .],
    // ['bread', '20', 'assets/items/.png', .],
    // ['bread', '20', 'assets/items/.png', .],
    // ['bread', '20', 'assets/items/.png', .],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
