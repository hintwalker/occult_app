import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cloud_service/firestore_service_provider.dart';

final energyDataSourceProvider = Provider.autoDispose<EnergyDataSource>(
    (ref) => EnergyDataSource(ref.read(firestoreServiceProvider)));
