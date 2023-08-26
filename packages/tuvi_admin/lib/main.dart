import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
// import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_entry_point/tauari_entry_point.dart';
import 'package:tauari_restorable_app/tauari_restorable_app.dart';
// import 'package:tauari_restorable_app/tauari_restorable_app.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_admin/src/router.dart';
import 'package:tuvi_admin/src/translation_path.dart';
import 'package:tuvi_style/tuvi_style.dart';
// import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tuvi_style/tuvi_style.dart';

import 'firebase_options.dart';
import 'src/app/restorable_state_impl.dart';
// import 'src/router.dart';

// part 'app_state.dart';
// part 'restorable_state.dart';
// part 'global_key.dart';
// part 'router.dart';
// part 'screen/home.dart';
// part 'screen/energy_market.dart';
// part 'menus.dart';
// part 'style/drawer_style_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(EntryPoint(
      translationPath: translationPath,
      supportedLocales: supportedLocales,
      startLocale: const Locale('vi'),
      child: ProviderScope(
        overrides: [
          restorableStateProvider.overrideWith((_) => RestorableStateImpl()),
          routerProvider.overrideWithValue(router),
          //     mainDrawerControllerProvider
          //         .overrideWithValue(TauariDrawerController()),
        ],
        child: RestorableApp(title: 'title', theme: AppTheme.light()),
      ),
    )),
  );
}
