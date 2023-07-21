import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class RequestReaderModal extends StatelessWidget {
  const RequestReaderModal({
    super.key,
    required this.request,
    required this.colorScheme,
    required this.translate,
    required this.child,
    required this.chartAvatar,
  });

  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Request request;
  final Widget child;
  final Widget Function(Request request) chartAvatar;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: colorScheme.background,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       const SizedBox(
            //         width: 8,
            //       ),
            //       IconButton(
            //           onPressed: () => Navigator.pop(context),
            //           icon: const Icon(Icons.arrow_back)),

            //       const SizedBox(
            //         width: 8,
            //       ),
            //       Expanded(
            //         child: Text(
            //           translate('request'),
            //           style: TextStyle(
            //               color: colorScheme.primary,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 18),
            //           overflow: TextOverflow.ellipsis,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 8,
            //       ),
            //       // chartAvatar(request),
            //       const SizedBox(
            //         width: 8,
            //       ),
            //       // CircleHumanAvatar(
            //       //   gender: chart.gender.intValue,
            //       //   path: chart.avatar,
            //       // ),
            //     ],
            //   ),
            // ),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: chartAvatar(request),
                ),
              ],
            ),
            // Padding(
            //     padding: const EdgeInsets.only(
            //       left: 8,
            //       right: 8,
            //     ),
            //     child: Card(
            //         child: InkWell(
            //           onTap: (){},
            //           borderRadius: BorderRadius.circular(12.0),
            //             child: Padding(padding: const EdgeInsets.all(12.0),child: Row(
            //       children: [
            //         chartAvatar(request),
            //       ],
            //     ),),),),),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
