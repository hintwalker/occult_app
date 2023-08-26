import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_restorable_app/tauari_restorable_app.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_style/tuvi_style.dart';

import '../router/router_provider.dart';

class LasotuviApp extends StatelessWidget {
  const LasotuviApp({
    super.key,
    required this.localDatabase,
  });
  final LocalDatabase<Database> localDatabase;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        localDatabaseProvider.overrideWithValue(localDatabase),
        routerProvider.overrideWith((ref) => ref.read(lasotuviRouterProvider)),
        mainDrawerControllerProvider
            .overrideWithValue(TauariDrawerController()),
        restorableStateProvider.overrideWith((ref) => RestorableStateImpl())
      ],
      child: RestorableApp(
        // routerProvider: routerProvider,
        title: translate('lasotuvi'),
        theme: AppTheme.light(),
      ),
    );
  }
}
