import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetalsScreen extends StatelessWidget {
  static const routeName = "/detals";

  const ProductDetalsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(id);
    return Scaffold(
        appBar: AppBar(title: Text(loadedProduct.title)),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
            ),
            Expanded(
                child: Container(
                    color: Colors.black12,
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      leading: Icon(Icons.money_off),
                      title: Text(loadedProduct.title),
                      subtitle: Text(loadedProduct.description),
                      trailing:Text('${loadedProduct.price} PLN', style:TextStyle(fontSize: 20, color: Theme.of(context).primaryColor))
                      
                    )))
          ],
        ));
  }
}
