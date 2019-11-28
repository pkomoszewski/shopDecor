import 'package:flutter/material.dart';
import "dart:convert";
import './product.dart';
import "package:http/http.dart" as http;
import '../models/http_exception.dart';


class Products with ChangeNotifier {
  List<Product> _items = [
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
          isPromo: proData['isPromo'],
          isfavorite: proData['isfavorite']

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
            'isfavorite':product.isfavorite,
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

 Future<void> updateProduct(String id, Product newProduct) async{
    final oldProduct = _items.indexWhere((prod) => prod.id == id);
    if (oldProduct >= 0) {
    
    final url = "https://flutterapp-addba.firebaseio.com/products/$id.json";
await http.patch(url,body:json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
            'isfavorite':newProduct.isfavorite
           

}));
 _items[oldProduct] = newProduct;
    notifyListeners();
   

     
    } else {
      print("Error index in product durning update product. Check index " +
          oldProduct.toString());
    }
  }

 Future<void> deleteProduct(String id) async{


     final url = "https://flutterapp-addba.firebaseio.com/products/$id.json";
       final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
   final response=await  http.delete(url);
   if(response.statusCode==400){
_items.insert(existingProductIndex, existingProduct);
   notifyListeners();
 throw HttpException('Could not delete product.');

   }
    
 notifyListeners();
  }
}
