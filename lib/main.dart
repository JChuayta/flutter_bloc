import 'package:example_bloc_app/screens/cart.dart';
import 'package:example_bloc_app/screens/catalog.dart';
import 'package:example_bloc_app/screens/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => CatalogScreen(),
        '/user': (context) => UserScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
