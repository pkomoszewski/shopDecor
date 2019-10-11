import 'package:flutter/material.dart';
import '../screens/favorite_screen.dart';

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
            width: double.infinity,
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("Shop Decor",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700))),
        SizedBox(height: 25),
        bulidListTitle("Main", Icons.shopping_basket,
        (){
          Navigator.of(context).pushReplacementNamed('/');
        }),
        bulidListTitle("Favorite", Icons.favorite,(){
            Navigator.of(context).pushReplacementNamed(FavoriteScreen.routeName);
        })
      ],
    ));
  }
}
