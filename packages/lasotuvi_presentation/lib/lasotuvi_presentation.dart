library lasotuvi_presentation;

import 'dart:async';

import 'package:energy_store/energy_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:storage_options/storage_options.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';
import 'package:tuvi_style/tuvi_style.dart';

part 'shared/translation_path.dart';
part 'shared/screen_app_bar.dart';

part 'helper/tag_helper.dart';
part 'helper/chart_helper.dart';
part 'helper/storage_helper.dart';
part 'helper/note_helper.dart';

part 'key/global_key.dart';
part 'app/restorable_state_impl.dart';
part 'app/app_state_impl.dart';
part 'styles/storage_plan_style_impl.dart';
part 'features/statistics/widget/current_sub_widget_container.dart';

part 'features/note/controller/note_editor_body_controller.dart';
part 'features/note/widget/note_editor_body.dart';

part 'features/library/library_body.dart';

part 'features/tag/checkbox_tag_list_body.dart';
part 'features/tag/tag_edit_body.dart';
part 'features/tag/tag_detail_body.dart';
part 'features/tag/tag_creation_body.dart';

part 'features/chart/widget/modify_bio/modify_watching_year_body.dart';
part 'features/chart/widget/modify_bio/controller/modify_chart_controller.dart';
part 'features/chart/widget/modify_bio/modify_chart_avatar_body.dart';
part 'features/chart/widget/modify_bio/modify_gender_body.dart';
part 'features/chart/widget/modify_bio/modify_birthday_body.dart';
part 'features/chart/widget/modify_bio/modify_chart_name_body.dart';

part 'features/chart/widget/chart_modification_options_body.dart';
part 'features/chart/widget/chart_detail_body.dart';
part 'features/chart/widget/single_selectable_chart_list_body.dart';
part 'features/chart/widget/checkbox_chart_list_body.dart';
part 'features/chart/widget/chart_view_body.dart';
part 'features/chart/widget/chart_screen_app_bar.dart';
part 'features/chart/widget/all_chart_list_body.dart';
part 'features/chart/widget/chart_creation_body.dart';

part 'features/storage_plan/all_storage_plans_body.dart';

part 'features/dashboard/dashboard.dart';

part 'features/navigation/energy_point_app_bar_action.dart';
part 'features/navigation/take_screen_title.dart';
part 'features/navigation/drawer_header.dart';
part 'features/navigation/drawer_ids.dart';
part 'features/navigation/main_navigation.dart';
part 'features/navigation/menus.dart';

part 'features/home/controller/home_controller.dart';
part 'features/home/widget/data_creation_options_modal.dart';
part 'features/home/widget/home_body.dart';

part 'styles/general_style.dart';
part 'styles/live_energy_style_impl.dart';
part 'styles/drawer_style_impl.dart';

part 'router/route_name.dart';
part 'router/route_path.dart';
part 'router/router_notifier.dart';
part 'router/router_notifier_provider.dart';
part 'router/router_params.dart';

part 'features/auth/user_auth_widget.dart';
part 'features/auth/auth_screen_body.dart';
part 'features/auth/auth_depended_state.dart';

part 'features/energy_market/market_body.dart';
