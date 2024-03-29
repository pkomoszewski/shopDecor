import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserProduct extends StatelessWidget {
  final String id;
  final String title;
  final String image;

  UserProduct(this.id, this.title, this.image);
  @override
  Widget build(BuildContext context) {
    final scaffold=Scaffold.of(context);

    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: ()async{  try{   Provider.of<Products>(
        context,
      ).deleteProduct(id);}catch(error){
       scaffold.showSnackBar(SnackBar(content: Text("Delecting failded!!"),));


        
      }},
            )
          ],
        ),
      ),
    );
  }
}
