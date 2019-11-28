import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import "dart:convert";
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

  Future<void> toogleFavorite() async{
      isfavorite = !isfavorite;
      final url = "https://flutterapp-addba.firebaseio.com/products/$id.json";
await http.patch(url,body:json.encode({
           
            'isfavorite':isfavorite
           

}));
    notifyListeners();
  }

  void tooglePromo() {
    isPromo = !isPromo;
    notifyListeners();
  }
}
