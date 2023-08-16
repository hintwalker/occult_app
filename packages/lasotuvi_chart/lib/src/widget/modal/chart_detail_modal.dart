import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChartDetailModal extends StatelessWidget {
  const ChartDetailModal(
    this.chart, {
    super.key,
    required this.colorScheme,
    required this.onOpenStarsModal,
    required this.onOpenBooksModal,
    required this.onOpenChartOptions,
    required this.onOpenChartEditOptions,
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
                              icon: const Icon(Icons.auto_awesome),
                              onPressed: onOpenStarsModal,
                            ),
                            IconButton(
                              icon: const Icon(Icons.book),
                              onPressed: onOpenBooksModal,
                            ),
                            IconButton(
                              icon: const Icon(Icons.tune),
                              onPressed: onOpenChartOptions,
                            ),
                            IconButton(
                              onPressed: () =>
                                  onOpenChartEditOptions(context, chart!),
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        )),
                    Expanded(child: child),
                  ]),
      ),
    );
  }
}
