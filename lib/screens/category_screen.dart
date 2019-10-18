import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);
  static const routeName = "/category";
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(id);

    return Center(
      child: Text("huj"),
    );
  }
}
