import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'catalog_event.dart';
import 'catalog_state.dart';
import '../../models/item_model.dart';

class CatalogBloc {
  CatalogState _catalogState = CatalogState();

  final _input = BehaviorSubject<CatalogEvent>();
  final _output = BehaviorSubject<List<ItemModel>>();

  StreamSink<CatalogEvent> get sendEvent => _input.sink;
  Stream<List<ItemModel>> get catalogStream => _output.stream;

  CatalogBloc() {
    _input.listen(_onEvent);
  }

// // Insertar valores al Stream
//   Function(String) get changeEmail => _emailController.sink.add;
//   Function(String) get changePassword => _passwordController.sink.add;

  void _onEvent(CatalogEvent event) {
    if (event is AddCatalogItemEvent) {
      _catalogState.addToCatalog(event.item);
    } else if (event is RemoveCatalogItemEvent) {
      _catalogState.removeFromCatalog(event.item);
    }

    _output.add(_catalogState.catalog);
  }

  void dispose() {
    _input?.close();
    _output?.close();
  }

  // // Obtener el último valor ingresado a los streams
  // String get email => _emailController.value;
  // String get password => _passwordController.value;
}
