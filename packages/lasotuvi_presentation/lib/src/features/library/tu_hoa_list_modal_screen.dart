import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_presentation/src/features/library/style/tu_hoa_list_style_impl.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../config/app_config.dart';

class TuHoaListModalScreen extends ConsumerStatefulWidget {
  const TuHoaListModalScreen({super.key});

  @override
  ConsumerState<TuHoaListModalScreen> createState() => _TuHoaModalScreenState();
}

class _TuHoaModalScreenState extends ConsumerState<TuHoaListModalScreen> {
  String currentSchool = 'vuongDinhChi';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(tuHoaListNotifierProvider.notifier).fetchData('vuongDinhChi');
    });
  }

  @override
  Widget build(BuildContext context) {
    const colorScheme = LasotuviAppStyle.colorScheme;
    return BasicModal(
      title: translate('tuHoa'),
      colorScheme: colorScheme,
      child: Column(
        children: [
          if (AppConfig.showAds) const BannerAds(id: AndroidAdsIds.banner),
          const SizedBox(
            height: 4.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: MaterialSegmentedControl<String>(
              children: _children,
              selectionIndex: currentSchool,
              borderColor: colorScheme.outline,
              selectedColor: colorScheme.primaryContainer,
              unselectedColor: colorScheme.background,
              selectedTextStyle: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold),
              unselectedTextStyle: TextStyle(color: colorScheme.onBackground),
              borderWidth: 0.7,
              borderRadius: 6.0,
              disabledChildren: const [],
              verticalOffset: 16.0,
              onSegmentTapped: (index) {
                setState(() {
                  currentSchool = index;
                  ref
                      .read(tuHoaListNotifierProvider.notifier)
                      .fetchData(currentSchool);
                });
              },
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Expanded(
            child: TuHoaListWidget(
              state: ref.watch(tuHoaListNotifierProvider),
              translate: translate,
              style: TuHoaListStyleImpl.apply(
                LasotuviAppStyle.colorScheme,
              ),
            ),
          )
        ],
      ),
    );
  }

  final Map<String, Widget> _children = {
    'vuongDinhChi': Text(translate('vuongDinhChi')),
    'tuViDauSoToanThu': Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        translate('tvdsToanThu'),
      ),
    ),
    'tuViDauSoToanTap': Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        translate('tvdsToanTap'),
      ),
    ),
    'lucBanTrieu': Text(translate('lucBanTrieu')),
    'khamThienMon': Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        translate('khamThienMon'),
      ),
    ),
    'manPhai': Text(translate('manPhai')),
    'khac': Text(translate('bacPhaiKhac')),
  };
}
