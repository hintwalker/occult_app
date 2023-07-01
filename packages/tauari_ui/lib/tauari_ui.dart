library tauari_ui;

import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;

part 'widget/basic_bottom_sheet.dart';
part 'widget/inset_shadow_container.dart';
part 'widget/data_grid_widget.dart';
part 'widget/data_grid_builder.dart';
part 'widget/basic_modal.dart';
part 'widget/pair_data_grid_builder.dart';
part 'widget/restorable_stateless_widget.dart';
part 'widget/top_ten_show_all_button.dart';
part 'widget/top_ten_add_data_button.dart';
part 'widget/top_ten_title_widget.dart';
part 'widget/top_ten_headline_widget.dart';
part 'widget/sync_status_ribbon_widget.dart';
part 'widget/error_text_widget.dart';
part 'widget/loading_widget.dart';
part 'widget/horizontal_data_list_builder.dart';
part 'widget/horizontal_pair_data_list_builder.dart';

part 'controller/syncable_data_stream_controller.dart';
part 'controller/syncable_data_manipulate_controller.dart';
part 'controller/syncable_data_list_stream_controller.dart';
part 'controller/syncable_pair_data_list_stream_controller.dart';

part 'circle_human_avatar.dart';
part 'storage_icon_button.dart';
part 'list_item_has_storage_icon.dart';
part 'date_time_widget.dart';
part 'duration_widget.dart';
part 'tauari_app.dart';
part 'entry_point.dart';
part 'provider/router_provider.dart';
part 'fade_transition_page.dart';
part 'restorable_app.dart';
part 'restorable_state.dart';
part 'app_state.dart';
part 'provider/restorable_state_provider.dart';
