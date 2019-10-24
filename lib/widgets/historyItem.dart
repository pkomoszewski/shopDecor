import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../providers/orders.dart';

class HistoryItem extends StatefulWidget {
  final OrdersItem historyOrder;
  HistoryItem(this.historyOrder);
  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Column(children: <Widget>[
      ListTile(
        title: Text('\$${widget.historyOrder.amount.toString()}',
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).accentColor)),
        subtitle:
            Text(DateFormat('dd-MM-yyyy').format(widget.historyOrder.dateTime)),
        trailing: IconButton(
          icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
      ),
      if (_expanded)
        Container(
          height: min(widget.historyOrder.products.length * 20.0, 100),
          child: ListView.builder(
            itemCount: widget.historyOrder.products.length,
            itemBuilder: (ctx, a) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.historyOrder.products[a].title),
                  Text(
                      '${widget.historyOrder.products[a].quantity} x \$${widget.historyOrder.products[a].price}'),
                ],
              );
            },
          ),
        ),
    ])));
  }
}
