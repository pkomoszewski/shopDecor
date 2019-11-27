import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/productItem.dart';
import '../providers/products.dart';

class ProductScreen extends StatefulWidget {
  final bool showFavorite;
  ProductScreen(this.showFavorite);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _isInit = true;
  var _isloading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isloading = true;
      });

      Provider.of<Products>(context).fetchandSetData().then((_) {
        setState(() {
          _isloading = false;
        });
      });

      _isInit = false;
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final producutsData = Provider.of<Products>(context);
    final products =
        widget.showFavorite ? producutsData.favoriteItems : producutsData.items;

    return _isloading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: products[i], child: ProductItem()),
          );
  }
}
