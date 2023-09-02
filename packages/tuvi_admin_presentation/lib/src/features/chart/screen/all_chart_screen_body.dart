import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth_provider/tauari_auth_provider.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_admin_presentation/src/style/admin_app_style.dart';
import 'package:tuvi_admin_presentation/src/style/chart_card_style_impl.dart';
import 'package:tuvi_chart_presentation/tuvi_chart_presentation.dart';
import 'package:tuvi_chart_provider/tuvi_chart_provider.dart';

class AllChartScreenBody extends ConsumerStatefulWidget {
  const AllChartScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AllChartScreenBodyState();
}

class AllChartScreenBodyState extends ConsumerState<AllChartScreenBody> {
  @override
  void initState() {
    super.initState();
    ref
        .read(chartListNotifierProvider.notifier)
        .streamData(ref.read(takeCurrentUserProvider)()?.uidInFirestore);
  }

  @override
  Widget build(BuildContext context) {
    return ChartCardGridView(
      translate: translate,
      state: ref.watch(chartListNotifierProvider),
      onSyncStatusTap: () {},
      onTap: (context, chart) {},
      itemStyle: ChartCardStyleImpl.apply(
        AdminAppStyle.colorScheme,
      ),
    );
  }
}
