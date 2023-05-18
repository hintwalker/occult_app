part of energy_store;

class Energy implements CloudStorable, Dumpable {
  final int value;
  const Energy(this.value);

  operator +(Energy other) {
    return Energy(value + other.value);
  }

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other is Energy &&
          other.runtimeType == runtimeType &&
          other.value == value;

  @override
  String get docId => docIdEnergy;

  @override
  Map<String, Object?> dump() => {ColumnEnergy.value: value};

  @override
  Map<String, Object?> toCloud() => {ColumnEnergy.value: value};

  @override
  int get hashCode => value.hashCode;
}
