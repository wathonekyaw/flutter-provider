import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/models/card_model.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cartItems = cartProvider.items.values.toList();
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cartItems[index];
                return CartItemTile(cartItem: cartItem);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),

            child: Text(
              'Total : \$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  CartItemTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    return ListTile(
      title: Text(cartItem.product.name),
      subtitle: Text('${cartItem.quantity} X \$${cartItem.product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        onPressed: () {
          cartProvider.removeFromCart(cartItem.product.id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
