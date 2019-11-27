import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/mainAppBar.dart';
import '../widgets/mainDrawer.dart';
import '../widgets/userProduct.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userproduct';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: MainAppbar(
        height: 200,
        isNew: "true",
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: productsData.items.length,
        itemBuilder: (ctx, i) {
          return Column(
            children: <Widget>[
              UserProduct(productsData.items[i].id, productsData.items[i].title,
                  productsData.items[i].imageUrl),
              Divider()
            ],
          );
        },
      ),
    );
  }
}
