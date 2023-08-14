import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../entity/energy.dart';
import '../controller/energy_widget_controller.dart';
import '../style/live_energy_style.dart';
import 'energy_icon.dart';

class LiveEnergyWidget extends StatelessWidget {
  const LiveEnergyWidget({
    super.key,
    // this.iconColor,
    // required this.textStyle,
    required this.controller,
    required this.style,
    required this.uid,
    required this.onTap,
  });
  final LiveEnergyStyle style;
  // final Color? iconColor;
  // final TextStyle textStyle;
  // final Widget text;
  final EnergyWidgetController controller;
  final String? uid;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Container(
            constraints: const BoxConstraints(minWidth: 58.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EnergyIcon(
                  color: style.iconColor,
                ),
                StreamBuilder(
                    initialData: const Energy(0),
                    stream: controller.energyStream(uid),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        final energy = formatThousandSeperator(
                            snapshot.requireData.value,
                            locale: Platform.localeName);
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            // return SlideTransition(
                            //   position: Tween<Offset>(
                            //           begin: const Offset(0.0, -0.5),
                            //           end: const Offset(0.0, 0.0))
                            //       .animate(animation),
                            //   child: child,
                            // );
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            energy,
                            key: ValueKey<String>(energy),
                            style: style.textStyle,
                          ),
                        );
                      } else {
                        return const Text('0');
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
