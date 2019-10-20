import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorite_screen.dart';
import '../widgets/mainDrawer.dart';
import '../screens/product_screen.dart';
import '../screens/category_screen.dart';
import '../widgets/mainAppBar.dart';

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
      appBar: MainAppbar(
        height: 200,
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
