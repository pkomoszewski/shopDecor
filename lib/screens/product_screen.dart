import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/productItem.dart';
import '../providers/products.dart';

class ProductScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final producutsData = Provider.of<Products>(context);
    final products = producutsData.items;
   
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
      itemCount:products.length, 
    
      itemBuilder: (ctx,i)=>ChangeNotifierProvider.value(
         value:products[i],
        child: ProductItem()),
       
      
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
    );
  }
}
