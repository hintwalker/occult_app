import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/router_provider.dart';

class TauariApp extends ConsumerWidget {
  const TauariApp({
    super.key,
    // required this.routerProvider,
    required this.title,
    required this.theme,
  });
  // final AutoDisposeProvider<GoRouter> routerProvider;
  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp.router(
      restorationScopeId: 'app',
      routerConfig: router,
      title: title,
      debugShowCheckedModeBanner: false,
      theme: theme,
      // home: const NavigationHomeScreen(
      //   homeScreen: HomeScreen(),
      //   getScreen: getScreen,
      // ),
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
