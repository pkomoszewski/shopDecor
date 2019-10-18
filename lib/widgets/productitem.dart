import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detals_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final order = Provider.of<Cart>(context);

    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetalsScreen.routeName, arguments: product.id);
        },
        child: Card(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: 120,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.title,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).accentColor)),
                      Text('${product.price.toString()} PLN',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold))
                    ],
                  )),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Consumer<Product>(
                      builder: (context, product, _) => IconButton(
                        color: product.isfavorite
                            ? Colors.red
                            : Theme.of(context).primaryColorDark,
                        icon: Icon(Icons.favorite),
                        onPressed: () => product.toogleFavorite(),
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColorDark,
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        order.addItem(product.id, product.price, product.title);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
