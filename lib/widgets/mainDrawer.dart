import 'package:flutter/material.dart';
import 'package:shopdecor/screens/history_order_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/hot_sale_screen.dart';
import '../icons/Custom_Icons.dart';

class MainDrawer extends StatelessWidget {
  Widget bulidListTitle(String name, IconData icon, Function tapFunction) {
    return ListTile(
        leading: Icon(icon),
        title: Text(name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        onTap: tapFunction);
  }

  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
            height: 120,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("Shop Decor",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 36,
                ))),
        SizedBox(height: 25),
        bulidListTitle("Home", MyFlutterApp.home, () {}),
        bulidListTitle("Product", MyFlutterApp.gift, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        bulidListTitle("Favorite", MyFlutterApp.heart, () {
          Navigator.of(context).pushReplacementNamed(FavoriteScreen.routeName);
        }),
        bulidListTitle("Hot Sale", MyFlutterApp.star, () {
          Navigator.of(context).pushReplacementNamed(HotSaleScreen.routeName);
        }),
        bulidListTitle("Your history", MyFlutterApp.user, () {
          Navigator.of(context)
              .pushReplacementNamed(HistoryOrderScreen.routeName);
        })
      ],
    ));
  }
}
