part of energy_store;

class EnergyModel extends CloudModel<Energy> {
  const EnergyModel(this.value);

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
