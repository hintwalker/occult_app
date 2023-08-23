import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:tauari_sqflite/tauari_sqflite.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../router/route_name.dart';

// import '../../router/route_name.dart';

class SplashScreenBody extends ConsumerStatefulWidget {
  const SplashScreenBody({super.key});

  @override
  ConsumerState<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends ConsumerState<SplashScreenBody> {
  List<Map<String, Object?>> data = [];
  Either<List<Map<String, Object?>>, bool> notes = const Right(false);
  String error = '';
  bool finished = false;
  @override
  void initState() {
    super.initState();
    loadOldData();
    // loadCloudData();
  }

  @override
  Widget build(BuildContext context) {
    // return const LoadingWidget();
    return Scaffold(
      body: SafeArea(
        child: error.isNotEmpty
            ? SingleChildScrollView(
                child: Column(children: [
                Center(
                  child: (Text(error)),
                )
              ]))
            : notes.fold(
                (left) => const Center(child: Icon(Icons.done)),
                // ListView.builder(
                //   itemCount: left.length,
                //   itemBuilder: (context, index) => Card(
                //       child: Text(left[index][ColumnNote.content].toString())
                //       // child: Column(
                //       //   children: OldNoteColumns.migratedColumns
                //       //       .map((e) => Text('$e: ${left[index][e]}'))
                //       //       .toList(),
                //       // ),
                //       ),
                // ),
                (right) => const LoadingWidget(),
              ),
      ),
    );
  }

  Future<void> loadOldData() async {
    final needLoadOldData = kDebugMode ? true : await IsFirstRun.isFirstCall();
    if (needLoadOldData) {
      try {
        await ref.read(migrateOldDataProvider).loadOldData();
        // setState(() {
        //   notes = data;
        // });

        // final db = await SqliteDatabase.openOtherDatabase(DatabaseNames.old);
        // final charts = await ref.read(migrateOldDataProvider).loadOldCharts(db);
        // charts.fold(
        //   (left) => setState(() => data = left),
        //   (right) => setState(() => error = right),
        // );
        // setState(() {
        // data = [
        //   {
        //     OldChartColumns.name: 'ABC',
        //     OldChartColumns.gender: 1,
        //   },
        //   {
        //     OldChartColumns.name: 'DEF',
        //     OldChartColumns.gender: 0,
        //   }
        // ];
        // });
      } on Exception catch (e) {
        setState(() {
          error = e.toString();
        });
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        context.goNamed(RouteName.home);
      }
    });
  }

  // Future<void> loadCloudData() async {
  //   final online = await ref.read(checkNetworkStatusProvider)();
  //   if (!online) {
  //     return;
  //   }
  //   final user = ref.read(takeCurrentUserProvider)();
  //   if (user == null) {
  //     return;
  //   }
  //   final cache = ref.read(firestoreCacheHelperProvider);
  //   final directory = await getApplicationCacheDirectory();
  //   await cache.ready(user.uidInFirestore, path: directory.path);
  // }
}
