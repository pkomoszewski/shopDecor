import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/mainAppBar.dart';
import '../widgets/mainDrawer.dart';
import '../widgets/historyItem.dart';

class HistoryOrderScreen extends StatefulWidget {
  static const String routeName = '/historyorders';

  @override
  _HistoryOrderScreenState createState() => _HistoryOrderScreenState();
}


class _HistoryOrderScreenState extends State<HistoryOrderScreen> {

  
  Widget build(BuildContext context) {
 final orderData =  Provider.of<Orders>(context);
    final userOrder = orderData.orders;
    return Scaffold(
        drawer: MainDrawer(),
        appBar: MainAppbar(height: 200,),

       
        body: ListView.builder(
          itemCount: userOrder.length,
          itemBuilder: (ctx, i) {
            return HistoryItem(userOrder[i]);
          },
        ) );
  }
}
