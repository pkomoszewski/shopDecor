import 'package:flutter/material.dart';
import 'package:shopdecor/screens/user_profil_screen.dart';
import '../icons/Custom_Icons.dart';
import '../screens/order_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String isNew;

  const MainAppbar({
    Key key,
    @required this.height,
    this.isNew,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(CustomIcons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Row(
            children: <Widget>[
              Consumer<Cart>(
                  builder: (_, cart, ch) => Badge(
                        child: ch,
                        value: cart.itemCount.toString(),
                      ),
                  child: IconButton(
                    icon: Icon(MyFlutterApp.cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(OrderScreen.routeName);
                    },
                  )),
              isNew == "true"
                  ? IconButton(
                      icon: Icon(Icons.add_box, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          EditProductScreen.routeName,
                        );
                      })
                  : IconButton(
                      icon: Icon(MyFlutterApp.user, color: Colors.black),
                      onPressed: () {
                          Navigator.of(context).pushNamed(
                          UserProfileScreen.routeName);
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
