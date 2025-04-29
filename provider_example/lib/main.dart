import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/cart_provider.dart';
import 'package:provider_example/providers/product_provider.dart';
import 'package:provider_example/screens/CartScreen.dart';
import 'package:provider_example/screens/ProductScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => ProductScreen(), '/cart': (context) => CartScreen()},
      ),
    ),
  );
}
