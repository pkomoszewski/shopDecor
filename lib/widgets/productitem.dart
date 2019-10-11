import 'package:flutter/material.dart';
import '../screens/product_detals_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetalsScreen.routeName, arguments: id);
              },
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )),
          footer: GridTileBar(
            backgroundColor: Theme.of(context).primaryColorDark,
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            title: Text(
              title,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
        ));
  }
}
