import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/check_network_status.dart';
import '../service/energy_firestore_service.dart';

final energyFirestoreDataSourceProvider =
    Provider.autoDispose<EnergyFirestoreDataSource>(
  (ref) => EnergyFirestoreDataSource(
    ref.read(energyFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
