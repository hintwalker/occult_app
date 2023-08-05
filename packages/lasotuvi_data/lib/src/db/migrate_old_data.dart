import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_sqflite/tauari_sqflite.dart';

import 'database_names.dart';
import 'table_names_old.dart';

class MigrateOldData {
  const MigrateOldData({
    required this.insertChartsToLocal,
    required this.insertTagsToLocal,
    required this.insertNotesToLocal,
    required this.insertChartTagsToLocal,
  });
  final InsertManyChartsToLocal insertChartsToLocal;
  final InsertManyTagsToLocal insertTagsToLocal;
  final InsertManyNotesToLocal insertNotesToLocal;
  final InsertManyChartTagsToLocal insertChartTagsToLocal;
  Future<void> loadOldData() async {
    if (!kDebugMode) {
      final exists = await SqliteDatabase.exists(DatabaseNames.old);
      if (!exists) {
        return;
      }
    }

    final oldDb = await SqliteDatabase.openOtherDatabase(DatabaseNames.old);
    await loadOldCharts(oldDb);
    await loadOldTags(oldDb);
    await loadOldNotes(oldDb);
    await loadOldChartTags(oldDb);
  }

  Future<Either<List<Map<String, Object?>>, String>> loadOldCharts(
      Database db) async {
    final data = kDebugMode
        ? [
            {
              OldChartColumns.name: 'ABC',
              OldChartColumns.avatar: 'file///asdf/asdf.sdf.asd',
              OldChartColumns.createdDate: 1691035285269,
              OldChartColumns.lastOpened: 1691035285269,
              OldChartColumns.dayGreg: 5,
              OldChartColumns.monthGreg: 3,
              OldChartColumns.yearGreg: 1997,
              OldChartColumns.hour: 14,
              OldChartColumns.minute: 45,
              OldChartColumns.watchingYear: 2021,
              OldChartColumns.gender: 1,
            }
          ]
        : await db.query(TableNamesOld.chart,
            columns: OldChartColumns.migratedColumns);
    List<Chart> charts = [];
    for (var item in data) {
      charts.add(Chart.fromOldVersion(item));
    }
    await insertChartsToLocal(charts);

    return Left(data);
  }

  Future<Either<List<Map<String, Object?>>, String>> loadOldTags(
      Database db) async {
    final data = kDebugMode
        ? [
            {
              OldTagColumns.name: 'ABC',
              OldTagColumns.description: 'description',
              OldTagColumns.createdDate: 1691035285270,
            }
          ]
        : await db.query(
            TableNamesOld.tag,
            columns: OldTagColumns.migratedColumns,
          );
    List<Tag> tags = [];
    for (var item in data) {
      tags.add(Tag.fromOldVersion(item));
    }
    await insertTagsToLocal(tags);

    return Left(data);
  }

  Future<Either<List<Map<String, Object?>>, String>> loadOldNotes(
      Database db) async {
    final data = kDebugMode
        ? [
            {
              OldNoteColumns.noteTitle: 'ABC',
              OldNoteColumns.noteText: 'description',
              OldNoteColumns.createdDate: 1691035285269,
              OldNoteColumns.lastUpdated: 1691035285269,
              OldNoteColumns.humanId: 1691035285269,
            }
          ]
        : await db.query(
            TableNamesOld.note,
            columns: OldNoteColumns.migratedColumns,
          );
    List<Note> notes = [];
    for (var item in data) {
      notes.add(Note.fromOldVersion(item));
    }
    await insertNotesToLocal(notes);

    return Left(data);
  }

  Future<Either<List<Map<String, Object?>>, String>> loadOldChartTags(
      Database db) async {
    final data = kDebugMode
        ? [
            {
              OldChartTagColumns.humanId: 1691035285269,
              OldChartTagColumns.tagId: 1691035285270,
            }
          ]
        : await db.query(
            TableNamesOld.chartTag,
            columns: OldChartTagColumns.migratedColumns,
          );
    List<ChartTag> chartTags = [];
    for (var item in data) {
      await Future.delayed(const Duration(milliseconds: 1));
      chartTags.add(
          ChartTag.fromOldVersion(DateTime.now().millisecondsSinceEpoch, item));
    }
    await insertChartTagsToLocal(chartTags);

    return Left(data);
  }
}
