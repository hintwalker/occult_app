import 'package:tauari_ui/tauari_ui.dart';

import 'app_state_impl.dart';

class RestorableStateImpl extends RestorableState<AppStateImpl> {
  @override
  AppStateImpl createDefaultValue() {
    return AppStateImpl();
  }

  @override
  AppStateImpl fromPrimitives(Object? data) {
    final appState = AppStateImpl();
    // final favorites = (data as List<dynamic>).cast<int>();
    // for (var id in favorites) {
    //   appState.setFavorite(id, true);
    // }
    return appState;
  }

  @override
  Object toPrimitives() {
    return value.favoriteVeggies.map((veggie) => veggie.id).toList();
  }
}
