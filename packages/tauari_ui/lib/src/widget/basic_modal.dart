import 'package:flutter/material.dart';
import 'package:tauari_ui/src/widget/basic_top_bar.dart';

class BasicModal extends StatelessWidget {
  const BasicModal({
    super.key,
    required this.title,
    required this.colorScheme,
    this.actions,
    required this.child,
    this.borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(24),
      bottomRight: Radius.circular(24),
    ),
  });
  final Widget child;
  final String title;
  final ColorScheme colorScheme;
  final BorderRadiusGeometry borderRadius;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      // child: SingleChildScrollView(
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BasicTopBar(
                title: Text(
                  title,
                  style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                colorScheme: colorScheme,
                actions: actions,
              ),
              // Container(
              //     decoration: BoxDecoration(
              //         borderRadius: borderRadius,
              //         color: colorScheme.background,
              //         boxShadow: [
              //           BoxShadow(
              //             color: colorScheme.background,
              //             offset: const Offset(0, 0),
              //             blurRadius: 0.0,
              //             spreadRadius: 0.0,
              //           ),
              //           BoxShadow(
              //             color: colorScheme.outline,
              //             offset: const Offset(2.0, 2.0),
              //             blurRadius: 1.0,
              //             spreadRadius: 0.2,
              //           ),
              //         ]),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         const SizedBox(
              //           width: 8,
              //         ),
              //         IconButton(
              //             onPressed: () => Navigator.maybePop(context),
              //             icon: const Icon(Icons.arrow_back)),
              //         const SizedBox(
              //           width: 8,
              //         ),
              //         Expanded(
              //           child: Text(
              //             title,
              //             style: TextStyle(
              //                 color: colorScheme.primary,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 18),
              //             overflow: TextOverflow.ellipsis,
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 8,
              //         ),
              //         if (actions != null)
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               ...actions!,
              //               const SizedBox(
              //                 width: 8.0,
              //               )
              //             ],
              //           )
              //       ],
              //     )),
              const SizedBox(
                height: 2.0,
              ),
              Expanded(child: child),
            ]),
      ),
    );
  }
}
