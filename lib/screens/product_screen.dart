import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopdecor/widgets/productitem.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/productitem.dart';
class ProductScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =productData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
      itemCount:products.length, 
      itemBuilder: (ctx,i)=>ProductItem(products[i].id, products[i].title, products[i].imageUrl),
      
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
    );
  }
}
