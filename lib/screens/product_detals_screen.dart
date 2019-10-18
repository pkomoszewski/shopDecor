import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/cart.dart';

class ProductDetalsScreen extends StatelessWidget {
  static const routeName = "/detals";

  const ProductDetalsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(id);
    final order = Provider.of<Cart>(context);

    void _newTaskModalBottomSheet(context) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
                height: 100,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${loadedProduct.title} add to box',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ));
          });
      order.addItem(loadedProduct.id, loadedProduct.price, loadedProduct.title);
    }

    return Scaffold(
        appBar: AppBar(title: Text(loadedProduct.title)),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
            ),
            Expanded(
              child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          title: Text(loadedProduct.title),
                          subtitle: Text(loadedProduct.description),
                          trailing: Text('${loadedProduct.price} PLN',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).accentColor))),
                      InkWell(
                          onTap: () {
                            _newTaskModalBottomSheet(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(border: Border.all()),
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            child: Text(
                              "buy",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          )),
                    ],
                  )),
            ),
          ],
        ));
  }
}
