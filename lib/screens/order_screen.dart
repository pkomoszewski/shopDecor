import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: <Widget>[
                        Text("Total :", style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  cart.items.isEmpty? 
                      InkWell(
                      
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/');

                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(border: Border.all()),
                          alignment: Alignment.center,
                          height: 40,
                          width: 100,
                          child: Text(
                            "Buy",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )):
                  
                    InkWell(
                      
                        onTap: ()async {
                         await Provider.of<Orders>(context, listen: false).addOrders(
                              cart.items.values.toList(), cart.totalAmount);
                          cart.cleanItems();

                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(border: Border.all()),
                          alignment: Alignment.center,
                          height: 40,
                          width: 100,
                          child: Text(
                            "Order",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
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
