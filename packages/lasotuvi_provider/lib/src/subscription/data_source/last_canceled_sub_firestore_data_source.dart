import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../utils/check_network_status.dart';
import '../service/last_canceled_sub_firestore_service.dart';

final lastCanceledSubFirestoreDataSourceProvider =
    Provider.autoDispose<LastCanceledSubFirestoreDataSource>((ref) =>
        LastCanceledSubFirestoreDataSource(
            ref.watch(lastCanceledSubFirestoreServiceProvider),
            availableNetwork: ref.read(checkNetworkStatusProvider).call));
