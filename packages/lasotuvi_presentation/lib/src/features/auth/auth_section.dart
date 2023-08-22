import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
import 'package:tauari_translate/tauari_translate.dart';
// import 'user_auth_widget.dart';

class AuthSection extends ConsumerWidget {
  const AuthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const avatarSize = 48.0;
    return Center(
      child: UserAuthWidget(
        controller: ref.watch(authControllerProvider),
        signInWidget: GoogleSignInButton(
            onTap: () => signIn(ref), title: translate('signIn')),
        signOutWidget: (user) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            user.photoUrl == null
                ? const Icon(
                    Icons.account_circle,
                    size: avatarSize,
                  )
                : ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(avatarSize)),
                    child: CachedNetworkImage(
                      imageUrl: user.photoUrl!,
                      height: avatarSize,
                      width: avatarSize,
                      fit: BoxFit.fill,
                      placeholder: (_, __) => const Icon(
                        Icons.account_circle,
                        size: avatarSize,
                      ),
                      errorWidget: (_, __, ___) => const Icon(
                        Icons.account_circle,
                        size: avatarSize,
                      ),
                    )
                    // Image.network(user.photoUrl!),
                    ),
            const SizedBox(height: 8.0),
            Text(user.displayName!),
            const SizedBox(height: 8.0),
            SignOutButton(
              onTap: () => signOut(ref),
              title: translate('signOut'),
            )
          ],
        ),
        syncData: (uid) => syncData(uid, ref),
      ),
    );
  }

  Future<void> signIn(WidgetRef ref) async {
    await ref.read(signInWithGoogleProvider)();
  }

  Future<void> signOut(WidgetRef ref) async {
    await ref.read(signOutProvider)();
  }

  Future<void> syncData(String uid, WidgetRef ref) async {
    await setupCache(uid, ref);

    await ref.read(syncChartsProvider)(uid);
    await ref.read(syncTagsProvider)(uid);
    await ref.read(syncNotesProvider)(uid);
    await ref.read(syncChartTagsProvider)(uid);
    await ref.read(syncRequestsProvider)(uid);
    await ref.read(syncNotificationsProvider)(uid);

    ref.read(chartDaoProvider).refreshDatabase();
  }

  Future<void> setupCache(String uid, WidgetRef ref) async {
    final Directory directory = await getApplicationCacheDirectory();

    final cache = ref.read(firestoreCacheHelperProvider);

    await cache.ready(uid, path: directory.path);
    await cache.clear();

    ref.read(energyCacheServiceProvider).setBox(cache.energyBox);
    ref.read(chartCacheServiceProvider).setBox(cache.chartBox);
    ref.read(tagCacheServiceProvider).setBox(cache.tagBox);
    ref.read(chartTagCacheServiceProvider).setBox(cache.chartTagBox);
    ref.read(noteCacheServiceProvider).setBox(cache.noteBox);
    ref.read(storagePlanCacheServiceProvider).setBox(cache.storagePlanBox);
    ref.read(currentSubCacheServiceProvider).setBox(cache.currentSubBox);
    ref
        .read(lastCanceledSubCacheServiceProvider)
        .setBox(cache.lastCanceledSubBox);

    await ref.read(pullEnergyProvider).call(
          uid,
          refresh: true,
        );
    await ref.read(pullCurrentSubProvider).call(
          uid,
          refresh: true,
        );
    await ref.read(pullLastCanceledSubProvider).call(
          uid,
          refresh: true,
        );
    await ref.read(pullStoragePlanProvider).call(
          uid,
          refresh: true,
        );
    await ref.read(pullChartProvider)(uid, refresh: true);
    await ref.read(pullTagProvider)(uid, refresh: true);
    await ref.read(pullChartTagProvider)(uid, refresh: true);
    await ref.read(pullNoteProvider)(uid, refresh: true);
    // await ref.read(pullCh)
  }
}
