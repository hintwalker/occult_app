import 'package:flutter/material.dart';

import '../../tauari_ui.dart';

class BasicLoadingModal extends StatelessWidget {
  const BasicLoadingModal({
    super.key,
    required this.colorScheme,
  });
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
        title: '',
        colorScheme: colorScheme,
        child: const Center(child: LoadingWidget()));
  }
}
