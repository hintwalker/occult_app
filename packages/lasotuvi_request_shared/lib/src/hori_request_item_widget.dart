import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tauari_values/tauari_values.dart';

import 'hori_request_birthday_widget.dart';
import 'hori_request_divider.dart';
import 'hori_request_name_widget.dart';
import 'hori_request_watching_year_widget.dart';

class HoriRequestItemWidget extends StatelessWidget {
  const HoriRequestItemWidget(
    this.item, {
    super.key,
    required this.uid,
    required this.translate,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
    this.padding = const EdgeInsets.only(right: 12.0),
  });
  final Request item;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Request request) onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final birthday =
        item.birthday.toMoment(TimeZone(offsetInHour: item.timeZoneOffset));

    return Padding(
      padding: padding,
      child: Stack(
        children: [
          Center(
            child: Card(
              margin: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () => onTap(context, item),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  constraints:
                      const BoxConstraints(minWidth: 120.0, maxWidth: 120.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          color: item.solved == RequestSolved.unSolved
                              ? colorScheme.primaryContainer.withOpacity(0.4)
                              : colorScheme.tertiaryContainer.withOpacity(0.6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                item.solved == RequestSolved.unSolved
                                    ? translate('processing')
                                    : translate('watchCommentary'),
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      SizedBox(
                        width: 48.0,
                        height: 48.0,
                        child: CircleHumanAvatar(
                          gender: item.gender.intValue,
                          path: item.avatar,
                          size: 48.0,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: HoriRequestNameWidget(item.name),
                      ),
                      const HoriRequestDivider(),
                      const SizedBox(
                        height: 4.0,
                      ),
                      HoriRequestBirthdayWidget(birthday, translate: translate),
                      const HoriRequestDivider(),
                      HoriRequestWatchingYearWidget(item.watchingYear,
                          translate: translate),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
                //   // constraints:
                //   //     const BoxConstraints(minWidth: 64.0, maxWidth: 160.0),
                //   child: child,
                // ),
              ),
            ),
          ),
          Visibility(
            visible: item.solved == RequestSolved.solved,
            child: Positioned(
              child: CircleContainer(
                fillColor: colorScheme.error,
                borderColor: colorScheme.onError,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '!',
                      style: TextStyle(
                        color: colorScheme.onError,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return SyncableCardItemScaffold(
    //   padding: const EdgeInsets.only(right: 12.0),
    //   uid: uid,
    //   colorScheme: colorScheme,
    //   onItemTap: () => onTap(context, item),
    //   syncStatus: item.syncStatus,
    //   onSyncStatusTap: onSyncStatusTap,
    //   child: Container(
    //     padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
    //     constraints: const BoxConstraints(minWidth: 120.0, maxWidth: 120.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         SizedBox(
    //           width: 48.0,
    //           height: 48.0,
    //           child: CircleHumanAvatar(
    //             gender: item.gender.intValue,
    //             path: item.avatar,
    //             size: 48.0,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 4.0,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //           child: HoriRequestNameWidget(item.name),
    //         ),
    //         const HoriRequestDivider(),
    //         const SizedBox(
    //           height: 4.0,
    //         ),
    //         HoriRequestBirthdayWidget(birthday, translate: translate),
    //         const HoriRequestDivider(),
    //         HoriRequestWatchingYearWidget(item.watchingYear,
    //             translate: translate),
    //       ],
    //     ),
    //   ),
    // );
  }
}
