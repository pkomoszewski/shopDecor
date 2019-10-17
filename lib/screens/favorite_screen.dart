import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/listTileProduct.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = "/favorite";
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final producutsData = Provider.of<Products>(context);
    final favoriteProducts = producutsData.favoriteItems;

    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: Container(
            // Add box decoration
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.6, 0.7, 0.9],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.indigo[800],
                  Colors.indigo[700],
                  Colors.indigo[600],
                  Colors.indigo[400],
                ],
              ),
            ),
            child: ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (ctx, i) => ListTileProduct(
                      favoriteProducts[i].id,
                      favoriteProducts[i].title,
                      favoriteProducts[i].description,
                      favoriteProducts[i].price,
                      favoriteProducts[i].toogleFavorite,
                    ))));
  }
}
