import 'energy_data_source.dart';

import 'package:tauari_firebase/tauari_firebase.dart';
import '../model/energy_model.dart';

class EnergyFirestoreDataSource extends EnergyDataSource {
  EnergyFirestoreDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) => snapshot.data() == null
              ? null
              : snapshotToModel(snapshot, fromMap: EnergyModel.fromMap),
        );
}
