import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_local_database_provider/tauari_local_database_provider.dart';
import 'package:tauari_restorable_app/tauari_restorable_app.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_admin/src/router/tuvi_admin_router_provider.dart';
import 'package:tuvi_admin_presentation/tuvi_admin_presentation.dart';
import 'package:tuvi_style/tuvi_style.dart';

class TuviAdminApp extends StatelessWidget {
  const TuviAdminApp({
    super.key,
    required this.localDatabase,
  });
  final LocalDatabase<Database> localDatabase;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        localDatabaseProvider.overrideWithValue(localDatabase),
        routerProvider.overrideWith((ref) => ref.read(tuviAdminRouterProvider)),
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
