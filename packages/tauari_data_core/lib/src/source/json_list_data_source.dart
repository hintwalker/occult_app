import 'dart:convert';

import 'package:flutter/services.dart';

abstract class JsonListDataSource<T> {
  JsonListDataSource({required this.fromMap});
  String get dataPath;
  // Iterable<T> data = [];
  final T Function(Map<String, Object?>) fromMap;

  // Future<void> initData() async {
  //   data = await loadData();
  // }

  Future<Iterable<T>> loadData() async {
    final jsonString = await rootBundle.loadString(dataPath);
    final listOfJsonElements = json.decode(jsonString) as List;
    return listOfJsonElements.map((jsonElement) => fromMap(jsonElement));
  }
}
