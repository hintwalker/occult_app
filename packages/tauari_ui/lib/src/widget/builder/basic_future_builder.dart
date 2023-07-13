import 'package:flutter/material.dart';

import '../../../tauari_ui.dart';

class BasicFutureBuilder<T> extends StatelessWidget {
  const BasicFutureBuilder({
    super.key,
    required this.future,
    required this.child,
  });
  final Future<T> future;
  final Widget Function(T) child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return child(snapshot.requireData);
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        });
  }
}
