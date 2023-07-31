import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';

import '../widget/chart_creation_modal_screen.dart';
import '../widget/chart_detail_modal_screen.dart';
import '../widget/chart_modification_options_modal_screen.dart';
import '../widget/chart_view_modal_screen.dart';
import '../widget/checkbox_chart_list_body.dart';
import '../widget/modify_bio/modify_birthday_body.dart';
import '../widget/modify_bio/modify_chart_avatar_body.dart';
import '../widget/modify_bio/modify_chart_name_body.dart';
import '../widget/modify_bio/modify_gender_body.dart';
import '../widget/modify_bio/modify_watching_year_body.dart';

class ChartNavigation {
  static void openChartCreationScreen(BuildContext context) {
    showDialog(
        context: context, builder: (_) => const ChartCreationModalScreen());
    // context.pushNamed(RouteName.chartCreation);
  }

  static void openChartDetail({
    required BuildContext context,
    required String chartId,
    required String? syncStatus,
  }) {
    showDialog(
        context: context,
        builder: (_) =>
            ChartDetailModalScreen(chartId: chartId, syncStatus: syncStatus));
  }

  static void openChartView({
    required BuildContext context,
    // required WidgetRef ref,
    required Chart chart,
  }) {
    showDialog(
        context: context,
        builder: (context) => ChartViewModalScreen(chart: chart),
        routeSettings: const RouteSettings(name: 'chartView'));
    // pageBuilder: (context, animation, secondaryAnimation) =>
    //     ChartViewBody(chart: chart),
    // routeSettings: const RouteSettings(name: 'chartView'));
  }

  static void openCheckboxChartList(BuildContext context, Tag tag) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          Material(child: CheckboxChartListBody(tag)),
    );
  }

  static void openChartEditOptions(BuildContext context, Chart chart) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChartModificationOptionsModalScreen(
        chartId: chart.id,
        syncStatus: chart.syncStatus,
      ),
    );
  }

  static void openModifyChartNameModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyChartNameBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyBirthdayModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyBirthdayBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyGenderModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyGenderBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyAvatarModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyChartAvatarBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static void openModifyWatchingYearModal({
    required BuildContext context,
    required int chartId,
    required String? syncStatus,
  }) {
    showDialog(
      context: context,
      builder: (context) => ModifyWatchingYearBody(
        chartId: chartId,
        syncStatus: syncStatus,
      ),
    );
  }

  static Future<void> showChartOptions({
    required BuildContext context,
    required WidgetRef ref,
    required void Function(Map<String, dynamic>) callback,
  }) async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      builder: (_) => const ChartOptionsModal(
        colorScheme: LasotuviAppStyle.colorScheme,
        translate: translate,
        // controller: ref.watch(chartOptionsModalControllerProvider),
      ),
    );
    if (result != null) {
      callback(result);
    }
  }
}
