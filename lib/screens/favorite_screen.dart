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
    final products = producutsData.items;

    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider(builder: (c)=>products[i],
            child: ListTileProduct(),
            )));
  }
}
