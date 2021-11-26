import 'package:flutter/material.dart';
import 'package:pizzerian/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart {
  List<CartItem> _items = [];

  int totalItems() { return _items.length; }
  CartItem getCartItem(int index) {
    return _items[index];
  }

  double totalPanier() {
    double total = 0;
    _items.forEach((item) {
      total = CartItem.pizza.total * quantity;     
    });
    // foreach sur _items
    // pizza.total * quantity (cartItem)

    return total;
  }

  void addProduct(Pizza pizza) {
    // Recherche d'un produit
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      // Ajout
      _items.add(CartItem(pizza));
    } else {
      // Incrémente la quantité
      CartItem item = _items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza) {
    // Recherche du produit 
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      // Supression
      
      CartItem item = _items[index];
      item.quantity--;
    } else {
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((item) => item.pizza.id == id);
  }
}