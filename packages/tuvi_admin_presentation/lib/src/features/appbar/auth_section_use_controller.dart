import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth_presentation/tauari_auth_presentation.dart';
import 'package:tauari_auth_provider/tauari_auth_provider.dart';
// import 'user_auth_widget.dart';

class AuthSectionUseController extends ConsumerWidget {
  const AuthSectionUseController({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const avatarSize = 48.0;
    return Center(
      child: UserAuthWidgetUsingController(
        controller: ref.watch(authControllerProvider),
        signInWidget: GoogleSignInButton(onTap: () => signIn(ref)),
        signOutWidget: (user) => user.photoUrl == null
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
        syncData: (uid) => syncData(uid, ref),
      ),
    );
  }

  Future<void> signIn(WidgetRef ref) async {
    await ref.read(signInWithEmailProvider)('horos@gmail.com', 'horosadmin');
  }

  Future<void> signOut(WidgetRef ref) async {
    await ref.read(signOutProvider)();
  }

  Future<void> syncData(String uid, WidgetRef ref) async {
    await setupCache(uid, ref);

    // await ref.read(syncChartsProvider)(uid);
    // await ref.read(syncTagsProvider)(uid);
    // await ref.read(syncNotesProvider)(uid);
    // await ref.read(syncChartTagsProvider)(uid);
    // await ref.read(syncRequestsProvider)(uid);
    // await ref.read(syncNotificationsProvider)(uid);

    // ref.read(chartDaoProvider).refreshDatabase();
  }

  Future<void> setupCache(String uid, WidgetRef ref) async {
    // final Directory directory = await getApplicationCacheDirectory();

    // final cache = ref.read(firestoreCacheHelperProvider);

    // await cache.ready(uid, path: directory.path);
    // await cache.clear();

    // ref.read(energyCacheServiceProvider).setBox(cache.energyBox);
    // ref.read(chartCacheServiceProvider).setBox(cache.chartBox);
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
    // await ref.read(pullChartProvider)(uid, refresh: true);
    // await ref.read(pullTagProvider)(uid, refresh: true);
    // await ref.read(pullChartTagProvider)(uid, refresh: true);
    // await ref.read(pullNoteProvider)(uid, refresh: true);
  }
}
