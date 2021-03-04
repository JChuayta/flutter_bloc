import 'package:example_bloc_app/blocs/catalog/catalog_state.dart';
import 'package:example_bloc_app/blocs/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/catalog/catalog_bloc.dart';
import '../blocs/catalog/catalog_event.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../models/item_model.dart';
import '../utils/format_total.dart';
import '../utils/get_initials.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // UserBloc _userBloc = UserBloc();
  // CatalogBloc _catalogBloc = CatalogBloc();

  @override
  void initState() {
    super.initState();
    // _userBloc.sendEvent.add(GetUsernameEvent());
    // _catalogBloc.sendEvent.add(GetCatalogEvent());
  }

  @override
  void dispose() {
    // _userBloc.dispose();
    // _catalogBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    // ignore: close_sinks
    final CatalogBloc _catalogBloc = BlocProvider.of<CatalogBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CatalogBloc, CatalogState>(
              builder: (_, state) {
                return ListView.builder(
                  itemCount: state.catalog.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      '${state.catalog[index].name}'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '\$${state.catalog[index].price.toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.amberAccent,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (_, state) {
                    return Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            getInitials('${state.username}').toUpperCase(),
                          ),
                        ),
                        Text(
                          '${state.username}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BlocBuilder<CatalogBloc, CatalogState>(
                      builder: (_, state) {
                        return Text(
                          '\$${formatTotal(state.catalog)}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30.0)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
