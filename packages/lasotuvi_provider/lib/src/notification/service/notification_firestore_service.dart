import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import '../../firebase/firebase_firestore_provider.dart';
import '../../utils/check_network_status.dart';

final notificationFirestoreServiceProvider = Provider(
  (ref) => NotificationFirestoreService(
      ref.watch(
        firebaseFirestoreProvider,
      ),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
