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
    final favoriteProducts = producutsData.findFavorite();

    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (ctx, i) => ListTileProduct(

                    favoriteProducts[i].id,
                    favoriteProducts[i].title,
                    favoriteProducts[i].description,
                    favoriteProducts[i].price
                  ),
                ));
  }
}
