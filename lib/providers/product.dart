import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final List size;
  bool isfavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.size,
    this.isfavorite = false,
  });

  void toogleFavorite() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}
