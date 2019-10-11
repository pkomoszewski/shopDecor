import 'package:flutter/material.dart';
import 'package:shopdecor/screens/tabs_screen.dart';
import './screens/order_screen.dart';
import './screens/favorite_screen.dart';
import './screens/product_detals_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(_Myapp());
}

class _Myapp extends StatefulWidget {
  _Myapp({Key key}) : super(key: key);

  _MyappState createState() => _MyappState();
}

class _MyappState extends State<_Myapp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder:(ctx)=>Products(),
        child: MaterialApp(
      title: "Shop Dector",
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          primaryColorDark: Colors.indigo[200],
          accentColor: Colors.white),
      home: TabsScreen(),
      routes: {
       ProductDetalsScreen.routeName:(ctx)=>ProductDetalsScreen()
      },
    ));
  }
}
