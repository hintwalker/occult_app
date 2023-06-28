library lasotuvi_data;

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';
import 'package:tauari_sqflite/tauari_sqflite.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

part 'chart/dao/chart_dao.dart';
part 'chart/model/chart_model.dart';
part 'chart/repository/chart_repository_impl.dart';
part 'chart/repository/local_chart_repository_impl.dart';
part 'chart/repository/cloud_chart_repository_impl.dart';
part 'chart/source/local/sqlite_chart_data_source.dart';
part 'chart/source/remote/firebase_chart_data_source.dart';

part 'chart_tag/dao/chart_tag_dao.dart';
part 'chart_tag/model/chart_tag_model.dart';
part 'chart_tag/repository/chart_tag_repository_impl.dart';
part 'chart_tag/repository/local_chart_tag_repository_impl.dart';
part 'chart_tag/repository/cloud_chart_tag_repository_impl.dart';
part 'chart_tag/source/local/sqlite_chart_tag_data_source.dart';
part 'chart_tag/source/remote/firebase_chart_tag_data_source.dart';

part 'tag/dao/tag_dao.dart';
part 'tag/model/tag_model.dart';
part 'tag/repository/tag_repository_impl.dart';
part 'tag/repository/cloud_tag_repository_impl.dart';
part 'tag/repository/local_tag_repository_impl.dart';
part 'tag/source/local/sqlite_tag_data_source.dart';
part 'tag/source/remote/firebase_tag_data_source.dart';

part 'note/repository/note_and_chart/note_and_chart_repository_impl.dart';
part 'note/repository/note_and_chart/cloud_note_and_chart_repository_impl.dart';
part 'note/repository/note_and_chart/local_note_and_chart_repository_impl.dart';
part 'note/dao/note_dao.dart';
part 'note/model/note_model.dart';
part 'note/repository/note_repository_impl.dart';
part 'note/repository/cloud_note_repository_impl.dart';
part 'note/repository/local_note_repository_impl.dart';
part 'note/source/local/sqlite_note_data_source.dart';
part 'note/source/remote/firebase_note_data_source.dart';
part 'note/editor/note_editor_cache.dart';

part 'db/sql_templates.dart';
part 'db/table_names.dart';
part 'db/on_db_created.dart';
part 'db/on_db_configure.dart';
part 'db/database_names.dart';
