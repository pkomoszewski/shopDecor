import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorite_screen.dart';
import '../widgets/mainDrawer.dart';
import '../screens/order_screen.dart';
import '../screens/product_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabscreen';
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
       {
        'page': ProductScreen(),
        'title': 'Products',
      },

      {
        'page': CategoryScreen(),
        'title': 'Category',
      },
      {
        'page': FavoriteScreen(),
        'title': 'Favorite',
      },
    ];
  }

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
                Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
