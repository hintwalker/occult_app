import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class DataCountWidget extends StatelessWidget {
  const DataCountWidget({
    super.key,
    required this.uid,
    required this.controller,
    required this.cloudController,
    required this.colorScheme,
  });
  final String? uid;
  final CountEveryWhereController controller;
  final CountOnCloudController cloudController;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
        stream: controller.stream(uid),
        child: (count) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '($count)',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 14,
                  ),
                ),
                if (uid != null)
                  const SizedBox(
                    width: 4.0,
                  ),
                if (uid != null)
                  BasicFutureBuilder(
                    future: cloudController.hasNetwork(),
                    child: (network) => network == null || !network
                        ? const SizedBox.shrink()
                        : BasicStreamBuilder(
                            stream: cloudController.stream(uid!),
                            child: (cloudCount) => Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Icon(
                                  Icons.cloud,
                                  color: colorScheme.tertiaryContainer,
                                  size: 28,
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  '${cloudCount ?? 0}',
                                  style: TextStyle(
                                    color: colorScheme.tertiary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  )
              ],
            ));
  }
}
