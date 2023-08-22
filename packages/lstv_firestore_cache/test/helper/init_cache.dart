import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

String initTestCache() {
  var path = Directory.current.path;
  final hivePath = '$path/test/hive_testing_path';
  Hive.init(hivePath);
  return hivePath;
}
