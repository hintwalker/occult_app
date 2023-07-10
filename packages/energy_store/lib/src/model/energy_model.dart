import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/column_energy.dart';
import '../entity/doc_id_energy.dart';
import '../entity/energy.dart';

class EnergyModel extends CloudModel<Energy> {
  EnergyModel(this.value);

  final int value;

  factory EnergyModel.fromMap(Map<String, Object?> map) {
    return EnergyModel(map[ColumnEnergy.value] as int);
  }

  @override
  String get docId => docIdEnergy;

  @override
  Map<String, Object?> dump() => {ColumnEnergy.value: value};

  @override
  Map<String, Object?> toCloud() => {ColumnEnergy.value: value};

  @override
  Energy toEntity() => Energy(value);

  factory EnergyModel.fromEntity(Energy entity) {
    return EnergyModel(entity.value);
  }
}
