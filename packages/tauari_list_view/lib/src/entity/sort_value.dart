import 'package:tauari_list_view/tauari_list_view.dart';

class SortValue {
  const SortValue(this.name, this.order);
  final String name;
  final ListOrder order;
  Map<String, Object?> dump() => {'name': name, 'order': order.name};

  factory SortValue.fromMap(Map<dynamic, dynamic> map) => SortValue(
        map['name'] as String,
        ListOrder.fromString(
          map['order'] as String,
        ),
      );
}
