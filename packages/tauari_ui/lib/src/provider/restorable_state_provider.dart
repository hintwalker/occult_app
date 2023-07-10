import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../restorable_state.dart';

final restorableStateProvider = ChangeNotifierProvider<RestorableState>(
  (_) => throw UnimplementedError(),
);
