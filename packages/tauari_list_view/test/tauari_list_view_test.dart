// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:tauari_utils/tauari_utils.dart';

void main() {
  test('should replace list item', () {
    final list = [const Item(true), const Item(false)];
    printList(list);
    for (var i = 0; i < list.length; i++) {
      list.update(i, list[i].copyWith(selected: false));
    }
    printList(list);
  });
}

void printList<T>(List<T> list) {
  for (var i = 0; i < list.length; i++) {
    print('$i: ${list[i]}');
  }
}

class Item {
  const Item(this.selected);
  final bool selected;
  Item copyWith({bool? selected}) {
    return Item(selected ?? this.selected);
  }

  @override
  String toString() {
    return selected.toString();
  }
}
