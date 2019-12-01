import 'package:flutter/material.dart';
import './cart.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class OrdersItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrdersItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrdersItem> _orders = [];

  List<OrdersItem> get orders {
    return [..._orders];
  }

  Future<void> addOrders(List<CartItem> products, double total) async {
    const url = "https://flutterapp-addba.firebaseio.com/orders.json";
    final time = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'products': products
                .map((p) => {
                      'id': p.id,
                      'title': p.title,
                      'quantity': p.quantity,
                      'price': p.price
                    })
                .toList(),
            'dateTime': time.toIso8601String(),
          }));
      print(response);
      print("dupa");
      final newOrders = OrdersItem(
          id: json.decode(response.body)['name'],
          amount: total,
          products: products,
          dateTime: DateTime.now());
      _orders.add(newOrders);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchandSetDataOrder() async {
    const url = "https://flutterapp-addba.firebaseio.com/orders.json";

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<OrdersItem> loadedProducts = [];

      if(extractedData!=null){
      extractedData.forEach((orderid, proData) {
        loadedProducts.add(OrdersItem(
          id: orderid,
          amount: proData['amount'],
          dateTime: DateTime.parse(proData['dateTime']),
          products: (proData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ));
      });
      _orders = loadedProducts;
      notifyListeners();
      }else{
         _orders = loadedProducts;
      }
    } catch (error) {
      print("dont connect to server");

      throw error;
    }
  }

  Future<void> deleteHistoryOrder(String id) async {
    final url = "https://flutterapp-addba.firebaseio.com/orders/$id.json";

    final existingOrdersIndex = _orders.indexWhere((prod) => prod.id == id);

    final existingOrder = _orders[existingOrdersIndex];
    _orders.removeAt(existingOrdersIndex);

    debugPrint(" connect to server");

    final response = await http.delete(url);
    
    if (response.statusCode ==400) {
      debugPrint("don't delete order");
      _orders.insert(existingOrdersIndex, existingOrder);
      notifyListeners();
    }

    notifyListeners();
  }

  void cleanOrder() {
    _orders.clear();
    notifyListeners();
  }
}
