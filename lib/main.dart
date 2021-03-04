import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './blocs/catalog/catalog_bloc.dart';
import './blocs/user/user_bloc.dart';
import './screens/cart.dart';
import './screens/catalog.dart';
import './screens/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatalogBloc()),
        BlocProvider(create: (_) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State Management',
        theme: ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => CatalogScreen(),
          '/user': (context) => UserScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
