import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        trailing: IconButton(
          icon:Icon(Icons.add_shopping_cart),
          color: Colors.blueAccent,
          onPressed: () {},
        ),
        leading: IconButton(
          icon:Icon(Icons.favorite),
          color: Colors.blueAccent,
          onPressed: () {},
        ),

        
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
