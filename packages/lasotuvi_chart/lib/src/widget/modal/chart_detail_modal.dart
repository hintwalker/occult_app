import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChartDetailModal extends UniversalWidget {
  const ChartDetailModal(
    this.chart, {
    super.key,
    required this.colorScheme,
    required this.onOpenStarsModal,
    required this.onOpenBooksModal,
    required this.onOpenChartOptions,
    required this.onOpenTuHoaList,
    required this.onOpenChartEditOptions,
    required super.translate,
    // required this.topBanner,
    required this.child,
  });
  final ColorScheme colorScheme;
  final Chart? chart;
  // final Widget? topBanner;
  final Widget child;
  final void Function() onOpenStarsModal;
  final void Function() onOpenBooksModal;
  final void Function() onOpenChartOptions;
  final void Function() onOpenTuHoaList;
  final void Function(BuildContext context, Chart chart) onOpenChartEditOptions;
  @override
  Widget build(BuildContext context) {
    return Material(
      // child: SingleChildScrollView(
      child: SafeArea(
        child: chart == null
            ? const Center(
                child: ErrorTextWidget(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                    // if(topBanner != null) topBanner!,
                    Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: colorScheme.background,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back)),
                            const SizedBox(
                              width: 8,
                            ),
                            CircleHumanAvatar(
                              gender: chart!.gender.intValue,
                              path: chart!.avatar,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                chart!.name,
                                style: TextStyle(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: onOpenTuHoaList,
                              icon: CircleContainer(
                                fillColor: colorScheme.background,
                                borderColor: colorScheme.onBackground,
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      color: colorScheme.onBackground),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.auto_awesome),
                              onPressed: onOpenStarsModal,
                            ),
                            MenuAnchor(
                                builder: (BuildContext context,
                                    MenuController controller, Widget? child) {
                                  return IconButton(
                                    onPressed: () {
                                      if (controller.isOpen) {
                                        controller.close();
                                      } else {
                                        controller.open();
                                      }
                                    },
                                    icon: const Icon(Icons.more_vert),
                                  );
                                },
                                menuChildren: [
                                  MenuItemButton(
                                    onPressed: onOpenBooksModal,
                                    leadingIcon: const Icon(Icons.book),
                                    child: Text(
                                      translate('referenceBooks'),
                                    ),
                                  ),
                                  MenuItemButton(
                                    onPressed: onOpenChartOptions,
                                    leadingIcon: const Icon(Icons.tune),
                                    child: Text(
                                      translate('chartOptions'),
                                    ),
                                  ),
                                  MenuItemButton(
                                    onPressed: () =>
                                        onOpenChartEditOptions(context, chart!),
                                    leadingIcon: const Icon(Icons.edit),
                                    child: Text(
                                      translate('editChart'),
                                    ),
                                  ),
                                ])
                          ],
                        )),
                    Expanded(child: child),
                  ]),
      ),
    );
  }
}
