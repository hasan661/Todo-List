import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/wishlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green.shade900,
          accentColor: Colors.greenAccent.shade100
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Hasan's TODO List",
              ),
            ),
            body: Wishlist()));
  }
}
