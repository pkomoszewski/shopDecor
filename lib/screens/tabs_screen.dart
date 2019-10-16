import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorite_screen.dart';
import '../widgets/mainDrawer.dart';
import '../screens/order_screen.dart';
import '../screens/product_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';

enum FilterOptions { Favorites, All }

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabscreen';
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var showFavorite = false;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': ProductScreen(showFavorite),
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

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selected) {
              if (selected == FilterOptions.Favorites) {
                setState(() {
                  showFavorite = true;
                  _pages[0]['page'] = ProductScreen(showFavorite);
                });
              } else {
                setState(() {
                  showFavorite = false;
                  _pages[0]['page'] = ProductScreen(showFavorite);
                });
              }
              print(showFavorite);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text(
                    "Show favorite only",
                  ),
                  value: FilterOptions.Favorites),
              PopupMenuItem(
                  child: Text(
                    "Show all",
                  ),
                  value: FilterOptions.All)
            ],
          ),
          Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                    child: ch,
                    value: cart.itemCount.toString(),
                  ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(OrderScreen.routeName);
                },
              )),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
