import 'package:flutter/material.dart';
import "dart:convert";
import './product.dart';
import "package:http/http.dart" as http;

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

  Future<void> fetchandSetData() async {
    const url = "https://flutterapp-addba.firebaseio.com/products.json";

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodid, proData) {
        loadedProducts.add(Product(
          id: prodid,
          title: proData['title'],
          description: proData['description'],
          price: proData['price'],
          imageUrl: proData['imageUrl'],
        ));
      });
      _items = loadedProducts;
    notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    const url = "https://flutterapp-addba.firebaseio.com/products.json";

    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isPromo': product.isfavorite,
            'promoPrice': product.isPromo
          }));

      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void updateProduct(String id, Product newProduct) {
    final oldProduct = _items.indexWhere((prod) => prod.id == id);
    if (oldProduct >= 0) {
      _items[oldProduct] = newProduct;
      notifyListeners();
    } else {
      print("Error index in product durning update product. Check index " +
          oldProduct.toString());
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
