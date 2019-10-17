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
          child: Card(
            color: Theme.of(context).errorColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Delete",
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 24),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => toogleFavorite(),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              title: Text(title),
              subtitle: Text(description),
              trailing: Text('${price.toString()} PLN',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor))),
        ));
  }
}
