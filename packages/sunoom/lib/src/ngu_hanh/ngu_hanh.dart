part of sunoom;

class NguHanh {
  final int index;
  final String name;
  const NguHanh({
    required this.index,
    required this.name,
  });

  // const factory NguHanh.unknown() = NguHanhUnknown;
  // const factory NguHanh.thuy() = NguHanhThuy;
  // const factory NguHanh.moc() = NguHanhMoc;
  // const factory NguHanh.kim() = NguHanhKim;
  // const factory NguHanh.tho() = NguHanhTho;
  // const factory NguHanh.hoa() = NguHanhHoa;

  NguHanhRel compareTo(NguHanh other) {
    final item = nguHanhRelData['rels']![index]! as List<int>;
    final relIndex = item[other.index];
    return NguHanhRel.fromIndex(relIndex);
  }

  factory NguHanh.fromIndex(int index) {
    final data = nguHanhData[index]!;
    return NguHanh.fromMap(data);
  }

  factory NguHanh.fromString(String name) {
    final data = nguHanhData.entries.firstWhere(
      (element) => name == element.value['name'] as String,
    );
    return NguHanh.fromMap(data.value);
  }

  factory NguHanh.fromMap(Map<String, Object> map) {
    return NguHanh(
      index: map['index'] as int,
      name: map['name'] as String,
    );
  }

  factory NguHanh.unknown() => NguHanh.fromIndex(-1);
}
