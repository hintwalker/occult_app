part of lasotuvi_domain;

class Energy extends CloudStorable {
  final int value;
  const Energy(this.value);

  operator +(Energy other) {
    return Energy(value + other.value);
  }

  @override
  String get docId => 'i';

  @override
  Map<String, Object?> dump() => {ColumnEnergy.value: value};

  @override
  Map<String, Object?> toCloud() => {ColumnEnergy.value: value};
}
