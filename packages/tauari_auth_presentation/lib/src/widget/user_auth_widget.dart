import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth/tauari_auth.dart';
// import 'package:tauari_auth_presentation/src/notifier/user_notifier.dart';
import 'package:tauari_auth_presentation/src/state/user_state.dart';
import 'package:tauari_ui/tauari_ui.dart';

class UserAuthWidget extends StatelessWidget {
  const UserAuthWidget({
    super.key,
    this.syncData,
    required this.state,
    required this.signInWidget,
    required this.signOutWidget,
  });
  // final AuthController controller;
  final UserState state;

  final Future<void> Function(String uid)? syncData;
  final Widget signInWidget;
  final Widget Function(UserEntity) signOutWidget;

  // @override
  // ConsumerState<ConsumerStatefulWidget> createState() => _UserAuthWidgetState();

  @override
  Widget build(BuildContext context) {
    return state.workingState == UserWorkingState.initial ||
            state.workingState == UserWorkingState.loading
        ? const LoadingWidget()
        : state.data == null
            ? signInWidget
            : signOutWidget(state.data!);
  }
}

// class _UserAuthWidgetState extends ConsumerState<UserAuthWidget> {
//   // late StreamSubscription<UserEntity?> subscription;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       widget.notifier.startListening();
//     });
//     // widget.controller.register(widget.syncData);
//     // final register = ref.read(registerOnAuthStateChangedProvider);

//     // subscription = widget.registerOnAuthStateChanged.call((user) async {
//     //   final savedUser = await widget.setupInitUser(user);
//     //   if (kDebugMode) {
//     //     print('Signed in: ${user.displayName} with uid = $savedUser');
//     //   }

//     //   if (widget.syncData != null) {
//     //     await widget.syncData!();
//     //   }

//     //   // await ref.read(syncChartsProvider)(savedUser);
//     //   // await ref.read(syncTagsProvider)(savedUser);
//     //   // await ref.read(syncNotesProvider)(savedUser);
//     //   // await ref.read(syncChartTagsProvider)(savedUser);
//     //   return savedUser;
//     // }, () {
//     //   if (kDebugMode) {
//     //     print('Signed out!');
//     //   }
//     // });
//   }

//   @override
//   void dispose() {
//     // widget.controller.unregister();
//     super.dispose();
//   }

//   // @override
//   // void dispose() {
//   //   subscription.cancel();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     return BasicStreamBuilder<UserEntity?>(
//       stream: widget.controller.stream(),
//       childIfNull: widget.signInWidget,
//       child: (user) {
//         if (user == null) {
//           return widget.signInWidget;
//         } else {
//           return widget.signOutWidget(user);
//         }
//       },
//     );
//     // final userStream = ref.watch(currentUserStreamProvider);
//     // return userStream.when(
//     //     data: (user) => user == null
//     //         ? Center(
//     //             child: ElevatedButton(
//     //                 onPressed: () {
//     //                   ref.read(signInWithGoogleProvider).call();
//     //                 },
//     //                 child: const Text('Đăng nhập')),
//     //           )
//     //         : Column(
//     //             crossAxisAlignment: CrossAxisAlignment.center,
//     //             children: [
//     //               user.photoUrl == null
//     //                   ? const Icon(
//     //                       Icons.account_circle,
//     //                       size: 64.0,
//     //                     )
//     //                   : ClipRRect(
//     //                       borderRadius:
//     //                           const BorderRadius.all(Radius.circular(64.0)),
//     //                       child: Image.network(user.photoUrl!)),
//     //               // CircleAvatar(
//     //               //   radius: 72,
//     //               //   backgroundColor: Colors.transparent,
//     //               //   child: user.photoUrl == null
//     //               //       ? const Icon(
//     //               //           Icons.account_circle,
//     //               //           size: 72.0,
//     //               //         )
//     //               //       // const CircleAvatar(
//     //               //       //     radius: 36,
//     //               //       //     backgroundColor: Colors.transparent,
//     //               //       //     backgroundImage:
//     //               //       //         Svg(AssetFiles.iconFeMale, size: Size(36, 36)),
//     //               //       //   )
//     //               //       : ClipRRect(
//     //               //           borderRadius:
//     //               //               const BorderRadius.all(Radius.circular(72.0)),
//     //               //           child: Image.network(user.photoUrl!)),
//     //               // ),
//     //               const SizedBox(height: 8.0),
//     //               Text(user.displayName!),
//     //               const SizedBox(height: 8.0),
//     //               ElevatedButton(
//     //                   onPressed: () {
//     //                     ref.read(signOutProvider).call();
//     //                   },
//     //                   child: const Text('Đăng xuất'))
//     //             ],
//     //           ),
//     //     error: (e, s) => const Text('error'),
//     //     loading: () => const Center(
//     //           child: CircularProgressIndicator(),
//     //         ));
//   }
// }
