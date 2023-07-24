import 'package:flutter/material.dart';
import 'sync_status_ribbon_widget.dart';

class SyncableCardItemScaffold extends StatelessWidget {
  const SyncableCardItemScaffold({
    super.key,
    required this.uid,
    required this.colorScheme,
    required this.onItemTap,
    required this.syncStatus,
    required this.onSyncStatusTap,
    this.padding = const EdgeInsets.only(right: 12.0),
    required this.child,
  });
  final ColorScheme colorScheme;
  final EdgeInsetsGeometry padding;
  final void Function() onItemTap;
  final String? uid;
  final Widget child;
  final String? syncStatus;
  final void Function()? onSyncStatusTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Stack(
        children: [
          // Center(
          //   child:
          Card(
            margin: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 4.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: onItemTap,
              child: child,
              // Container(
              //   padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
              //   // constraints:
              //   //     const BoxConstraints(minWidth: 64.0, maxWidth: 160.0),
              //   child: child,
              // ),
            ),
          ),
          // ),
          Positioned(
            child: SyncStatusRibbonWidget(
              uid: uid,
              syncStatus: syncStatus,
              colorScheme: colorScheme,
              onTap: () {
                if (onSyncStatusTap != null) {
                  onSyncStatusTap!();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
