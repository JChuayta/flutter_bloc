import 'dart:async';
import 'package:bloc/bloc.dart';

import 'catalog_event.dart';
import 'catalog_state.dart';
// import '../../models/item_model.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogState());
  // CatalogState _catalogState = CatalogState();

  // StreamController<CatalogEvent> _input = StreamController();
  // StreamController<List<ItemModel>> _output =
  //     StreamController<List<ItemModel>>.broadcast();

  // StreamSink<CatalogEvent> get sendEvent => _input.sink;
  // Stream<List<ItemModel>> get catalogStream => _output.stream;

  // CatalogBloc() {
  //   _input.stream.listen(_onEvent);
  // }

  // void _onEvent(CatalogEvent event) {
  //   if (event is AddCatalogItemEvent) {
  //     _catalogState.addToCatalog(event.item);
  //   } else if (event is RemoveCatalogItemEvent) {
  //     _catalogState.removeFromCatalog(event.item);
  //   }

  //   _output.add(_catalogState.catalog);
  // }

  // void dispose() {
  //   _input.close();
  //   _output.close();
  // }

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is AddCatalogItemEvent) {
      state.addToCatalog(event.item);
    } else if (event is RemoveCatalogItemEvent) {
      state.removeFromCatalog(event.item);
    }
  }
}
