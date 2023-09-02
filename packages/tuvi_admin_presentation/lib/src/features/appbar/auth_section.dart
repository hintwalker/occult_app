import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tauari_auth_presentation/tauari_auth_presentation.dart';
import 'package:tauari_auth_provider/tauari_auth_provider.dart';
import 'package:tauari_firestore_cache/tauari_firestore_cache.dart';
import '../../style/admin_app_style.dart';
import 'package:tuvi_chart_provider/tuvi_chart_provider.dart';

class AuthSection extends ConsumerStatefulWidget {
  const AuthSection({super.key});

  Future<void> signIn(WidgetRef ref) async {
    //   await ref.read(signInWithGoogleProvider)();
    await ref.read(signInWithEmailProvider)('horos@gmail.com', 'horosadmin');
  }

  Future<void> signOut(WidgetRef ref) async {
    await ref.read(signOutProvider)();
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AuthSectionState();
}

class AuthSectionState extends ConsumerState<AuthSection> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    ref
        .read(userNotifierProvier.notifier)
        .startListening(onSignIn: (uid) => syncData(uid, ref));
    // ref.read(userNotifierProvier.notifier).currentUser();

    // });
  }

  @override
  Widget build(BuildContext context) {
    const avatarSize = 36.0;
    // final state = ref.watch(userNotifierProvier);
    return UserAuthWidget(
      state: ref.watch(userNotifierProvier),
      signInWidget: GoogleSignInButton(
        onTap: () => widget.signIn(ref),
      ),
      signOutWidget: (user) => user.photoUrl == null
          ? IconButton(
              onPressed: () => widget.signOut(ref),
              icon: Icon(
                Icons.account_circle,
                size: avatarSize,
                color: AdminAppStyle.colorScheme.outline,
              ),
            )
          : ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(avatarSize)),
              child: CachedNetworkImage(
                imageUrl: user.photoUrl!,
                height: avatarSize,
                width: avatarSize,
                fit: BoxFit.fill,
                placeholder: (_, __) => Icon(
                  Icons.account_circle,
                  size: avatarSize,
                  color: AdminAppStyle.colorScheme.outline,
                ),
                errorWidget: (_, __, ___) => Icon(
                  Icons.account_circle,
                  size: avatarSize,
                  color: AdminAppStyle.colorScheme.outline,
                ),
              )
              // Image.network(user.photoUrl!),
              ),
    );

    // return BasicStreamBuilder(
    //   stream: ref.watch(userNotifierProvier.notifier).currentUser(),
    //   child: (user) => user == null
    //       ? GoogleSignInButton(
    //           onTap: () => widget.signIn(ref),
    //         )
    //       : user.photoUrl == null
    //           ? IconButton(
    //               onPressed: () => widget.signOut(ref),
    //               icon: Icon(
    //                 Icons.account_circle,
    //                 size: avatarSize,
    //                 color: AdminAppStyle.colorScheme.outline,
    //               ),
    //             )
    //           : ClipRRect(
    //               borderRadius:
    //                   const BorderRadius.all(Radius.circular(avatarSize)),
    //               child: CachedNetworkImage(
    //                 imageUrl: user.photoUrl!,
    //                 height: avatarSize,
    //                 width: avatarSize,
    //                 fit: BoxFit.fill,
    //                 placeholder: (_, __) => Icon(
    //                   Icons.account_circle,
    //                   size: avatarSize,
    //                   color: AdminAppStyle.colorScheme.outline,
    //                 ),
    //                 errorWidget: (_, __, ___) => Icon(
    //                   Icons.account_circle,
    //                   size: avatarSize,
    //                   color: AdminAppStyle.colorScheme.outline,
    //                 ),
    //               )
    //               // Image.network(user.photoUrl!),
    //               ),
    // );
  }

  Future<void> syncData(String uid, WidgetRef ref) async {
    await setupCache(uid, ref);

    if (kDebugMode) {
      print('syncing data');
    }
    await ref.read(syncChartsProvider)(uid);
    // await ref.read(syncTagsProvider)(uid);
    // await ref.read(syncNotesProvider)(uid);
    // await ref.read(syncChartTagsProvider)(uid);
    // await ref.read(syncRequestsProvider)(uid);
    // await ref.read(syncNotificationsProvider)(uid);

    // ref.read(chartDaoProvider).refreshDatabase();
  }

  Future<void> setupCache(String uid, WidgetRef ref) async {
    final Directory directory = await getApplicationCacheDirectory();

    final cache = FirestoreCacheHelper();

    await cache.ready(uid, path: directory.path);
    await cache.clear();

    // ref.read(energyCacheServiceProvider).setBox(cache.energyBox);
    ref.read(chartCacheServiceProvider).setBox(cache.chartBox);
    // ref.read(tagCacheServiceProvider).setBox(cache.tagBox);
    // ref.read(chartTagCacheServiceProvider).setBox(cache.chartTagBox);
    // ref.read(noteCacheServiceProvider).setBox(cache.noteBox);
    // ref.read(storagePlanCacheServiceProvider).setBox(cache.storagePlanBox);
    // ref.read(currentSubCacheServiceProvider).setBox(cache.currentSubBox);
    // ref
    //     .read(lastCanceledSubCacheServiceProvider)
    //     .setBox(cache.lastCanceledSubBox);

    // await ref.read(pullEnergyProvider).call(
    //       uid,
    //       refresh: true,
    //     );
    // await ref.read(pullCurrentSubProvider).call(
    //       uid,
    //       refresh: true,
    //     );
    // await ref.read(pullLastCanceledSubProvider).call(
    //       uid,
    //       refresh: true,
    //     );
    // await ref.read(pullStoragePlanProvider).call(
    //       uid,
    //       refresh: true,
    //     );
    if (kDebugMode) {
      print('pulling chart');
    }
    await ref.read(pullChartProvider)(uid, refresh: true);
    // await ref.read(pullTagProvider)(uid, refresh: true);
    // await ref.read(pullChartTagProvider)(uid, refresh: true);
    // await ref.read(pullNoteProvider)(uid, refresh: true);
  }
}
