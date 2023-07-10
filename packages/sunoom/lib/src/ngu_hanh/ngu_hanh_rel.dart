import 'ngu_hanh_rel_parts.dart';

class NguHanhRel {
  final int index;
  final String name;
  const NguHanhRel({
    required this.index,
    required this.name,
  });
  // const factory NguHanhRel.unknown() = NguHanhRelUnknown;
  // const factory NguHanhRel.tiHoa() = TiHoa;

  factory NguHanhRel.fromIndex(int index) {
    return NguHanhRel.fromMap(
        nguHanhRelData['items']![index]! as Map<String, Object>);
    // switch (index) {
    //   case 0:
    //     return NguHanhRel.tiHoa();
    //   default:
    //     return NguHanhRel.unknown();
    // }
  }

  factory NguHanhRel.fromMap(Map<String, Object> map) {
    return NguHanhRel(
      index: map['index'] as int,
      name: map['name'] as String,
    );
  }
}
