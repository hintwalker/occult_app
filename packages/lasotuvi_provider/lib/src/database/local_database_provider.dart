import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

final localDatabaseProvider =
    Provider<LocalDatabase<Database>>((ref) => throw UnimplementedError());
