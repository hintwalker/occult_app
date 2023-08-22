import 'package:energy_store/src/model/energy_model.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/doc_id_energy.dart';

abstract class EnergyDataSource extends CloudSingleDocDataSource<EnergyModel> {
  EnergyDataSource(
    super.service, {
    required super.availableNetwork,
    required super.itemMapper,
  });
  @override
  String dataCollectionPath(String uid) => 'e/$uid/e';

  @override
  String get docId => docIdEnergy;
}
