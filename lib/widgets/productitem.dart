import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detals_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final order = Provider.of<Cart>(context);

    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductDetalsScreen.routeName,
                      arguments: product.id);
                },
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                )),
            footer: GridTileBar(
              backgroundColor: Theme.of(context).primaryColorDark,
              leading: Consumer<Product>(
                builder: (context, product, _) => IconButton(
                  icon: Icon(Icons.favorite,
                      color: product.isfavorite ? Colors.red : Colors.grey),
                  onPressed: () {
                    product.toogleFavorite();
                  },
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Theme.of(context).accentColor,
                onPressed: () =>
                    order.addItem(product.id, product.price, product.title),
              ),
              title: Text(
                product.title,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 15),
              ),
            ),
          )),
    );
  }
}
