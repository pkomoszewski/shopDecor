import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/listTileProduct.dart';
import '../widgets/mainAppBar.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = "/favorite";
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final producutsData = Provider.of<Products>(context);
    final favoriteProducts = producutsData.favoriteItems;

    return Scaffold(
        drawer: MainDrawer(),
        appBar: MainAppbar(
          height: 200,
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.6,
                ],
                colors: [
                  Colors.grey[200],
                  Colors.grey[50],
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
