import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class BasicStreamBuilder<T> extends StatelessWidget {
  const BasicStreamBuilder({
    super.key,
    required this.stream,
    required this.child,
    this.childIfNull = const Text(''),
  });
  final Stream<T> stream;
  final Widget Function(T?) child;
  final Widget childIfNull;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
            // final data = snapshot.requireData;
            // if (data == null) {
            //   return const ErrorTextWidget();
            // } else {

            // }
          } else {
            if (snapshot.hasData) {
              return child(snapshot.requireData);
            } else {
              return child(null);
            }
          }
        });
  }
}
