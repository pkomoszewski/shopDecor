import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/orderItem.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';
  const OrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your order"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("Total :", style: TextStyle(fontSize: 18)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16))
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, i) => OrderItem(
                          cart.items.values.toList()[i].id,
                          cart.items.keys.toList()[i],
                          cart.items.values.toList()[i].title,
                          cart.items.values.toList()[i].price,
                          cart.items.values.toList()[i].quantity,
                        )))
          ],
        ));
  }
}
