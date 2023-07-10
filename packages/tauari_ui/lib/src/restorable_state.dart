import 'package:flutter/material.dart';

import 'app_state.dart';

abstract class RestorableState<T extends AppState>
    extends RestorableListenable<T> {
  // @override
  // AppState createDefaultValue() {
  //   return AppState();
  // }

  // @override
  // AppState fromPrimitives(Object? data) {
  //   final appState = AppState();
  //   final favorites = (data as List<dynamic>).cast<int>();
  //   for (var id in favorites) {
  //     appState.setFavorite(id, true);
  //   }
  //   return appState;
  // }

  // @override
  // Object toPrimitives() {
  //   return value.favoriteVeggies.map((veggie) => veggie.id).toList();
  // }
}
