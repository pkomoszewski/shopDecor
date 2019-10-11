import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetalsScreen extends StatelessWidget {
  static const routeName = "/detals";

  const ProductDetalsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id =ModalRoute.of(context).settings.arguments as String;
final loadedProduct =Provider.of<Products>(context).findById(id);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.money_off),
          title: Text(loadedProduct.title),
          subtitle: Text(loadedProduct.description),
          trailing: Text(loadedProduct.price.toString()),
        )
      ],
       

      
    ));
  }
}