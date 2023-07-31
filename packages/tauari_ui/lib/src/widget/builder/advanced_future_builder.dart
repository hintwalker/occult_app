import 'package:flutter/material.dart';

import '../../../tauari_ui.dart';

class AdvancedFutureBuilder<T> extends StatelessWidget {
  const AdvancedFutureBuilder({
    super.key,
    required this.future,
    required this.child,
    // this.childIfNull = const Text(''),
  });
  final Future<T> future;
  final Widget Function(T?) child;
  // final Widget childIfNull;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return child(snapshot.requireData);
            } else {
              return child(snapshot.data);
            }
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        });
  }
}
