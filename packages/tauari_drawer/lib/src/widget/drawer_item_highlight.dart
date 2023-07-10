import 'package:flutter/material.dart';

import '../drawer_style.dart';

class DrawerItemHighlight extends StatelessWidget {
  const DrawerItemHighlight(
      {super.key,
      required this.visible,
      // required this.animationController,
      required this.style});

  final bool Function() visible;
  // final AnimationController animationController;
  final DrawerStyle style;

  @override
  Widget build(BuildContext context) {
    return visible()
        ? Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75 - 64,
              height: 46,
              decoration: BoxDecoration(
                color: style.itemHighlightColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(28),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(28),
                ),
              ),
            ),
          )
        // ? AnimatedBuilder(
        //     animation: animationController,
        //     builder: (BuildContext context, Widget? child) {
        //       return Transform(
        //         transform: Matrix4.translationValues(
        //             (MediaQuery.of(context).size.width * 0.75 - 64) *
        //                 (1.0 - animationController.value - 1.0),
        //             0.0,
        //             0.0),
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: 8, bottom: 8),
        //           child: Container(
        //             width: MediaQuery.of(context).size.width * 0.75 - 64,
        //             height: 46,
        //             decoration: BoxDecoration(
        //               color: style.itemHighlightColor,
        //               borderRadius: const BorderRadius.only(
        //                 topLeft: Radius.circular(0),
        //                 topRight: Radius.circular(28),
        //                 bottomLeft: Radius.circular(0),
        //                 bottomRight: Radius.circular(28),
        //               ),
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   )
        : const SizedBox();
  }
}
