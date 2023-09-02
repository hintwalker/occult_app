import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';

import '../../../config/app_config.dart';
import '../navigation/chart_navigation.dart';
import '../../auth/user_auth_depended_state.dart';

class ChartCreationModalScreen extends ConsumerStatefulWidget {
  const ChartCreationModalScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartCreationModalScreenState();
}

class _ChartCreationModalScreenState
    extends UserAuthDependedState<ChartCreationModalScreen> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const BasicLoadingModal(
            colorScheme: LasotuviAppStyle.colorScheme,
          )
        : BasicModal(
            title: translate('createChart'),
            colorScheme: LasotuviAppStyle.colorScheme,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ChartCreationForm(
                      colorScheme: LasotuviAppStyle.colorScheme,
                      translate: translate,
                      onCreateChart: (chart) => onCreateChart(
                        Chart.empty().copyWith(
                          id: chart.id,
                          name: chart.name,
                          gender: chart.gender,
                          birthday: chart.birthday,
                          watchingYear: chart.watchingYear,
                          timeZoneOffset: chart.timeZoneOffset,
                          created: chart.created,
                          lastViewed: chart.lastViewed,
                          avatar: chart.avatar,
                          syncStatus: chart.syncStatus,
                          storageState: chart.storageState,
                          modified: chart.modified,
                          uploadDate: chart.uploadDate,
                        ),
                      ),
                    ),
                  ),
                ),
                if (AppConfig.showAds)
                  const BannerAds(id: AndroidAdsIds.banner),
              ],
            ),
          );
  }

  Future<void> onCreateChart(Chart chart) async {
    await ref.read(insertChartToLocalProvider)(chart);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
        ChartNavigation.openChartView(
          context: context,
          chart: chart,
          saveLastView: true,
        );
      }
    });
  }
}
