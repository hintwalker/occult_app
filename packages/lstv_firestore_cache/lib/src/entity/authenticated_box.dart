import 'package:hive_flutter/hive_flutter.dart';

class AuthenticatedBox {
  const AuthenticatedBox({
    required this.uid,
    required this.box,
  });
  final String? uid;
  final CollectionBox box;
}
