import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

import '../../styles/live_energy_style_impl.dart';
import '../auth/user_auth_depended_state.dart';

class EnergyPointAppBarAction extends ConsumerStatefulWidget {
  const EnergyPointAppBarAction({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBarTrailingState();
}

class _AppBarTrailingState
    extends UserAuthDependedState<EnergyPointAppBarAction> {
  // StreamSubscription? _streamSubscription;
  // String? uid;
  // @override
  // void initState() {
  //   super.initState();
  //   startListening();
  // }

  // void startListening() {
  //   _streamSubscription =
  //       ref.read(registerOnAuthStateChangedProvider).call((user) {
  //     if (kDebugMode) {
  //       print('AppBarTrailing: signin!');
  //     }
  //     // startListening();
  //     setState(() {
  //       uid = user.uidInFirestore;
  //     });
  //     // _streamSubscription?.resume();
  //     return user.uidInFirestore;
  //   }, () {
  //     if (kDebugMode) {
  //       print('AppBarTrailing: signout!');
  //     }
  //     // stopListening();
  //     setState(() {
  //       uid = null;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   if (kDebugMode) {
  //     print('AppBarTrailing: disposed!');
  //   }
  //   _streamSubscription?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(energyWidgetControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: LiveEnergyWidget(
        style: LiveEnergyStyleImpl(),
        controller: controller,
        uid: uid,
        onTap: widget.onTap,
      ),
    );
  }
}
