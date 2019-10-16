import 'package:flutter/material.dart';

class ListTileProduct extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final Function toogleFavorite;

  ListTileProduct(
      this.id, this.title, this.description, this.price, this.toogleFavorite);
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => toogleFavorite(),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            leading: IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () {},
            ),
            title: Text(title),
            subtitle: Text(description),
            trailing: Text('${price.toString()} PLN',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor))));
  }
}
