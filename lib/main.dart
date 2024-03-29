import 'package:flutter/material.dart';
import 'package:shopdecor/screens/tabs_screen.dart';
import './screens/order_screen.dart';
import './screens/favorite_screen.dart';
import './screens/product_detals_screen.dart';
import './providers/products.dart';
import './providers/orders.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './screens/category_screen.dart';
import './screens/hot_sale_screen.dart';
import './screens/history_order_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/user_profil_screen.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          )
        ],
        child: MaterialApp(
          title: "Shop Dector ",
          theme: ThemeData(
              primaryColor: Colors.white,
              primaryColorDark: Colors.grey[400],
              accentColor: Colors.black,
              fontFamily: "Montserrat-Medium"),
          home: TabsScreen(),
          routes: {
            ProductDetalsScreen.routeName: (ctx) => ProductDetalsScreen(),
            FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            CategoryScreen.routeName: (ctx) => CategoryScreen(),
            HotSaleScreen.routeName: (ctx) => HotSaleScreen(),
            HistoryOrderScreen.routeName: (ctx) => HistoryOrderScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            UserProfileScreen.routeName: (ctx) => UserProfileScreen()
          },
        ));
  }
}
