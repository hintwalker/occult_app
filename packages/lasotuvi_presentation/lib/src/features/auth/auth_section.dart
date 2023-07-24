import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
import 'package:tauari_translate/tauari_translate.dart';
// import 'user_auth_widget.dart';

class AuthSection extends ConsumerWidget {
  const AuthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    size: 64.0,
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                    child: Image.network(user.photoUrl!)),
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
    await ref.read(syncChartsProvider)(uid);
    await ref.read(syncTagsProvider)(uid);
    await ref.read(syncNotesProvider)(uid);
    await ref.read(syncChartTagsProvider)(uid);
    await ref.read(syncRequestsProvider)(uid);
    await ref.read(syncNotificationsProvider)(uid);
    ref.read(chartDaoProvider).refreshDatabase();
  }
}
