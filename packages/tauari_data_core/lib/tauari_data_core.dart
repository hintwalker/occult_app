library tauari_data_core;

// import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:ordered_set/ordered_set.dart';
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tauari_values/tauari_values.dart';
import 'package:flutter/services.dart';

part 'usecase/syncable/on_syncable_carrier_data.dart';
part 'usecase/syncable/on_syncable_data.dart';
part 'usecase/syncable/on_by_id.dart';
part 'usecase/syncable/upload.dart';
part 'usecase/syncable/download.dart';
part 'usecase/cloud/take_by_id_on_cloud.dart';
part 'usecase/syncable/take_by_id.dart';
part 'usecase/local/insert_to_local.dart';
part 'usecase/syncable/on_count_every_where.dart';
part 'usecase/cloud/on_count_on_cloud.dart';
part 'usecase/local/on_count_on_local.dart';
part 'usecase/syncable/delete_every_where.dart';
part 'usecase/syncable/sync_data.dart';
part 'usecase/cloud/delete_from_cloud.dart';
part 'usecase/local/delete_from_local.dart';

part 'entity/entity.dart';
part 'entity/sortable.dart';
part 'model/cloud_storable.dart';
part 'entity/cloud_getable.dart';
part 'entity/statable.dart';
part 'entity/syncable.dart';
part 'entity/sqlite_getable.dart';
part 'model/sqlite_storable.dart';
part 'entity/dumpable.dart';
part 'entity/set_of_entity.dart';
part 'entity/syncable_entity.dart';
part 'entity/pool_set_of_entity.dart';
part 'entity/syncable_entity_carrier.dart';
part 'entity/syncable_entity_pair.dart';

part 'model/model.dart';
part 'model/syncable_model.dart';
part 'model/local_model.dart';
part 'model/cloud_model.dart';

part 'query/cloud_data_order_by.dart';
part 'query/cloud_data_where.dart';
part 'query/query_args.dart';
part 'query/query_entity_args.dart';
part 'dao/dao.dart';
part 'service/cloud_service.dart';
part 'constant/column_names.dart';
part 'db/local_database.dart';

part 'repository/read_only_cloud_repository.dart';
part 'repository/entity_repository.dart';
part 'repository/cloud_repository.dart';
part 'repository/local_repository.dart';
part 'repository/syncable_repository.dart';
part 'repository/json_list_repository.dart';
part 'repository/cloud_single_doc_repository.dart';
part 'repository/dep/syncable_dependent_repository.dart';
part 'repository/dep/local_dependent_repository.dart';
part 'repository/dep/cloud_dependent_repository.dart';

part 'repository/impl/syncable_repository_impl.dart';
part 'repository/impl/local_repository_impl.dart';
part 'repository/impl/cloud_repository_impl.dart';
part 'repository/impl/read_only_cloud_repository_impl.dart';
part 'repository/impl/cloud_single_doc_repository_impl.dart';
part 'repository/impl/rel/local_rel_repository_impl.dart';
part 'repository/impl/rel/cloud_rel_repository_impl.dart';
part 'repository/impl/rel/syncable_rel_repository_impl.dart';
part 'repository/impl/dep/local_dependent_repository_impl.dart';
part 'repository/impl/dep/cloud_dependent_repository_impl.dart';
part 'repository/impl/dep/syncable_dependent_repository_impl.dart';
part 'repository/impl/json_list_repository_impl.dart';

part 'repository/rel/syncable_rel_repository.dart';
part 'repository/rel/local_rel_repository.dart';
part 'repository/rel/cloud_rel_repository.dart';

part 'source/local_data_source.dart';
part 'source/remote_data_source.dart';
part 'source/cloud_single_doc_data_source.dart';
part 'source/no_sql_data_source.dart';
part 'source/json_list_data_source.dart';
