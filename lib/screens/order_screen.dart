import 'package:flutter/material.dart';
class OrderScreen extends StatelessWidget {
  static const routeName ='/order';
  const OrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your order"),),
      body: Column(
        children: <Widget>[
          Text("Your order")
        ],
      ),
    );
  }
}