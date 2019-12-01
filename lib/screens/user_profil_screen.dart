import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/userprofile';

  const UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User profile"),
        ),
        body: Column(
          children: <Widget>[
            Text("User"),
            Text("Data to order"),
            Text("Email")
          ],
        ));
  }
}
