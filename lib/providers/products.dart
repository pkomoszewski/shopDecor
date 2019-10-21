import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        size: ["S", "M", "L", "XXL"],
        isPromo: true,
        promoPrice: 15.20),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      size: ["29", "30", "32", "34"],
    ),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description:
            'Warm and cozy - exactly what you need for the winter.Warm and cozy . ',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        size: [],
        isPromo: true,
        promoPrice: 10.30),
    Product(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        size: ["small-16", "medium-20", "big-24"],
        isPromo: true,
        promoPrice: 25.30),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isfavorite).toList();
  }

  List<Product> get promoItems {
    return _items.where((item) => item.isPromo).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((items) => items.id == id);
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
