import 'package:flutter/material.dart';
import '../icons/Custom_Icons.dart';
import '../screens/order_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MainAppbar({
    Key key,
    @required this.height,
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
              IconButton(
                icon: Icon(MyFlutterApp.user, color: Colors.black),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
