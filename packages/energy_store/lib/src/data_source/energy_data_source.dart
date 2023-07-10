import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../entity/doc_id_energy.dart';
import '../model/energy_model.dart';

class EnergyDataSource extends CloudSingleDocDataSource<EnergyModel> {
  EnergyDataSource(super.service)
      : super(
          itemMapper: (snapshot) => snapshotToModel(snapshot,
              fromMap: EnergyModel.fromMap, idIsString: true),
        );

  @override
  String dataCollectionPath(String uid) => 'e/$uid/e';

  @override
  String get docId => docIdEnergy;
}
