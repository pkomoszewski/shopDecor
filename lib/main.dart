import 'package:flutter/material.dart';
import 'package:shopdecor/screens/tabs_screen.dart';
import './screens/order_screen.dart';
import './screens/favorite_screen.dart';

void main(){
  runApp(_Myapp());
}
class _Myapp extends StatefulWidget {
  _Myapp({Key key}) : super(key: key);

  __MyappState createState() => __MyappState();
}

class __MyappState extends State<_Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: "Shop Dector",
       theme: ThemeData(primaryColor: Colors.white),
       routes: { 
        '/': (ctx) => TabsScreen(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        OrderScreen.routeName:(ctx)=> OrderScreen(),
      },
    );
  }
}