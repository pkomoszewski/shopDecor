import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class OrderItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  OrderItem(
    this.id,
    this.productId,
    this.title,
    this.price,
    this.quantity,
  );

  @override
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
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Do you want delete this product form box?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text("Yes"),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      )
                    ],
                  ));
        },
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: LayoutBuilder(builder: (context, constrainst) {
            var height = constrainst.maxHeight;
            var width = constrainst.maxWidth;
            return Container(
                height: 100,
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width * 0.5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColorDark,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: FittedBox(
                              child: Text(
                                '\$${price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        title: Text(title),
                        subtitle: Text(
                            'Total: \$${(price * quantity).toStringAsFixed(2)}'),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          color: Theme.of(context).primaryColorDark,
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .substractItem(productId);
                          },
                        ),
                        Text('$quantity x'),
                        IconButton(
                          color: Theme.of(context).primaryColorDark,
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addNextItem(productId);
                          },
                        ),
                      ],
                    ),
                  ],
                ));
          }),
        ));
  }
}
