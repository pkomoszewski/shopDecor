import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ListTileProduct extends StatelessWidget {
 
 

  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      leading: IconButton(icon:
                        Icon(Icons.favorite, color: Colors.white), onPressed: (){

                        },),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                      trailing:Text('${product.price} PLN', style:TextStyle(fontSize: 20, color: Theme.of(context).primaryColor))
    );
  }
}