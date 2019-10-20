import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final List size;
  bool isfavorite;
  bool isPromo;
  final double promoPrice;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.size,
    this.isfavorite = false,
    this.isPromo = false,
    final this.promoPrice,
  });

  void toogleFavorite() {
    isfavorite = !isfavorite;
    notifyListeners();
  }

  void tooglePromo() {
    isPromo = !isPromo;
    notifyListeners();
  }
}
