import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ListTileProduct extends StatelessWidget {
 
 final String id;
 final String title;
 final String description;
 final double price;

ListTileProduct(this.id,this.title,this.description, this.price);
  Widget build(BuildContext context) {
  
    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      leading: IconButton(icon:
                        Icon(Icons.favorite, color: Colors.white), onPressed: (){

                        },),
                      title: Text(title),
                      subtitle: Text(description),
                      trailing:Text('${price.toString()} PLN', style:TextStyle(fontSize: 20, color: Theme.of(context).primaryColor))
    );
  }
}