library lasotuvi_provider;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energy_store/energy_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_firebase/tauari_firebase.dart';
import 'package:tauari_purchase/tauari_purchase.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_utils/tauari_utils.dart';

part 'storage/downloader_provider.dart';
part 'storage/remover_provider.dart';
part 'storage/uploader_provider.dart';

part 'drawer/main_drawer_controller_provider.dart';

part 'subscription/usecase/extends_subscription_provider.dart';
part 'subscription/usecase/unsubscribe_plan_provider.dart';
part 'subscription/usecase/subscribe_plan_provider.dart';
part 'subscription/usecase/update_current_sub_provider.dart';
part 'subscription/usecase/on_current_sub_provider.dart';
part 'subscription/usecase/take_current_sub_provider.dart';
part 'subscription/repository/subscription_repository_provider.dart';
part 'subscription/repository/current_sub_repository_provider.dart';
part 'subscription/data_source/subscription_data_source_provider.dart';
part 'subscription/data_source/current_sub_data_source_provider.dart';
part 'subscription/controller/expired_timer_controller_provider.dart';
part 'subscription/controller/current_sub_controller_provider.dart';

part 'storage_plan/usecase/take_storage_plan_by_id_provider.dart';
part 'storage_plan/usecase/take_all_storage_plans_provider.dart';
part 'storage_plan/repository/storage_plan_repository_provider.dart';
part 'storage_plan/data_source/storage_plan_data_source_provider.dart';
part 'storage_plan/controller/storage_plan_list_controller_provider.dart';

part 'chart/dao/chart_dao_provider.dart';
part 'chart/data_source/firebase_chart_data_source_provider.dart';
part 'chart/data_source/sqlite_chart_data_source_provider.dart';
part 'chart/repository/chart_repository_provider.dart';
part 'chart/repository/cloud_chart_repository_provider.dart';
part 'chart/repository/local_chart_repository_provider.dart';

part 'chart/controller/chart_detail_controller.dart';
part 'chart/controller/chart_view_controller.dart';
part 'chart/controller/chart_list_controller_provider.dart';

part 'chart/usecase/on_chart.dart';
part 'chart/usecase/on_charts_provider.dart';
part 'chart/usecase/upload_chart.dart';
part 'chart/usecase/delete_chart_from_cloud.dart';
part 'chart/usecase/delete_chart_from_local.dart';
part 'chart/usecase/download_chart.dart';
part 'chart/usecase/insert_chart_to_local.dart';
part 'chart/usecase/sync_charts.dart';

part 'chart_tag/controller/tag_has_charts_list_controller.dart';
part 'chart_tag/controller/chart_has_tags_list_controller_provider.dart';

part 'chart_tag/usecase/dis_connect_tags_from_chart.dart';
part 'chart_tag/usecase/connect_tags_to_chart.dart';
part 'chart_tag/usecase/dis_connect_charts_from_tag.dart';
part 'chart_tag/usecase/connect_charts_to_tag.dart';
part 'chart_tag/usecase/on_tag_has_charts.dart';
part 'chart_tag/usecase/on_chart_has_tags.dart';
part 'chart_tag/usecase/on_tag_has_chart_list.dart';
part 'chart_tag/usecase/on_chart_has_tags_list.dart';
part 'chart_tag/usecase/sync_chart_tags.dart';
part 'chart_tag/dao/chart_tag_dao_provider.dart';
part 'chart_tag/data_source/firebase_chart_tag_data_source.dart';
part 'chart_tag/data_source/sqlite_chart_tag_data_source_provider.dart';
part 'chart_tag/repository/cloud_chart_tag_repository.dart';
part 'chart_tag/repository/local_chart_tag_repostory_provider.dart';
part 'chart_tag/repository/chart_tag_repository.dart';

part 'tag/controller/tag_detail_controller.dart';
part 'tag/controller/tag_list_controller_provider.dart';
part 'tag/repository/tag_repository.dart';
part 'tag/repository/cloud_tag_repository.dart';
part 'tag/repository/local_tag_repository.dart';
part 'tag/data_source/firebase_tag_data_source.dart';
part 'tag/data_source/sqlite_tag_data_source.dart';
part 'tag/dao/tag_dao_provider.dart';

part 'tag/usecase/update_tag.dart';
part 'tag/usecase/delete_tag_from_cloud.dart';
part 'tag/usecase/delete_tag_from_local.dart';
part 'tag/usecase/download_tag.dart';
part 'tag/usecase/on_tags.dart';
part 'tag/usecase/upload_tag.dart';
part 'tag/usecase/sync_tags.dart';
part 'tag/usecase/insert_tag_to_local.dart';

part 'note/controller/note_editor_controller.dart';
part 'note/controller/note_list_controller.dart';
part 'note/controller/note_and_chart_list_controller.dart';

part 'note/usecase/on_notes.dart';
part 'note/usecase/on_note_by_chart_id.dart';
part 'note/usecase/insert_note_to_local.dart';

part 'note/usecase/on_note_by_id.dart';
part 'note/usecase/sync_notes.dart';
part 'note/usecase/on_note_and_chart.dart';
part 'note/usecase/delete_note_from_cloud.dart';
part 'note/usecase/delete_note_from_local.dart';
part 'note/usecase/download_note.dart';
part 'note/usecase/upload_note.dart';
part 'note/dao/note_dao.dart';
part 'note/data_source/firebase_note_data_source.dart';
part 'note/data_source/sqlite_note_data_source.dart';
part 'note/repository/cloud_note_repository.dart';
part 'note/repository/local_note_repository.dart';
part 'note/repository/note_repostiory.dart';

part 'note/repository/note_and_chart/cloud_note_and_chart_repository.dart';
part 'note/repository/note_and_chart/local_note_and_chart_repository.dart';
part 'note/repository/note_and_chart/note_and_chart_repository.dart';

part 'database/local_database_provider.dart';

part 'user/user_data_source_provider.dart';
part 'user/set_user_provider.dart';
part 'user/user_repository_provider.dart';
part 'user/setup_init_user_provider.dart';

part 'auth/usecase/take_current_user_provider.dart';
part 'auth/auth_notifier_provider.dart';
part 'auth/auth_data_source_provider.dart';
part 'auth/auth_repository_provider.dart';
part 'auth/auth_service_provider.dart';
part 'auth/auth_state_changes_provider.dart';
part 'auth/current_user_provider.dart';
part 'auth/current_user_stream_provider.dart';
part 'auth/firebase_auth_provider.dart';
part 'auth/register_on_auth_state_changed_provider.dart';
part 'auth/sign_in_with_google_provider.dart';
part 'auth/sign_out_provider.dart';

part 'energy_store/controller/energy_store_controller_provider.dart';
part 'energy_store/controller/energy_widget_controller_provider.dart';
part 'energy_store/energy_data_source_provider.dart';
part 'energy_store/energy_repository_provider.dart';
part 'energy_store/usecase/plus_energy_provider.dart';
part 'energy_store/usecase/take_energy_provider.dart';
part 'energy_store/usecase/on_energy_provider.dart';

part 'purchase/usecase/subscribe_purchase_listing_changes_provider.dart';
part 'purchase/usecase/post_resolve_purchase_provider.dart';
part 'purchase/usecase/buy_consumable_product_provider.dart';
part 'purchase/usecase/query_product_details_provider.dart';
part 'purchase/usecase/available_for_sell_provider.dart';

part 'purchase/purchase_data_source_provider.dart';
part 'purchase/purchase_repository_provider.dart';
part 'firebase/firebase_firestore_provider.dart';
part 'cloud_service/firestore_service_provider.dart';
