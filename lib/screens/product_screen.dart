import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/productItem.dart';
import '../providers/products.dart';

class ProductScreen extends StatelessWidget {
  final bool showFavorite;
  ProductScreen(this.showFavorite);

  Widget build(BuildContext context) {
    final producutsData = Provider.of<Products>(context);
    final products =
        showFavorite ? producutsData.favoriteItems : producutsData.items;

    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i], child: ProductItem()),
    );
  }
}
