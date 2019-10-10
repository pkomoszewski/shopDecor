import 'package:flutter/material.dart';
import '../widgets/mainDrawer.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = "/favorite";
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: Container(
          child: Text("Favorite"),
        ));
  }
}
