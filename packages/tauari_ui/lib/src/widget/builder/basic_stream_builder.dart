import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class BasicStreamBuilder<T> extends StatelessWidget {
  const BasicStreamBuilder({
    super.key,
    required this.stream,
    required this.child,
  });
  final Stream<T> stream;
  final Widget Function(T) child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.requireData;
            if (data == null) {
              return const ErrorTextWidget();
            } else {
              return child(data);
            }
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        });
  }
}
