import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(id: 'p1', name: 'Laptop', price: 1500),
    Product(id: 'p2', name: 'Smartphone', price: 800),
    Product(id: 'p3', name: 'HeadPhones', price: 200),
  ];
  List<Product> get products => _products;
}
