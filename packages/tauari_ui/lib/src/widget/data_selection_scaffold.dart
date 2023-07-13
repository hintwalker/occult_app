import 'package:flutter/material.dart';

class DataSelectionScaffold extends StatelessWidget {
  const DataSelectionScaffold({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.child,
    required this.onCancel,
    required this.onSubmit,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Widget child;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext onSubmit) onSubmit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        child,
        Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  color: colorScheme.background,
                  // border: Border(
                  //   top: BorderSide(color: colorScheme.outline),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.outline,
                      offset: const Offset(0, 0),
                      spreadRadius: 12.0,
                      blurRadius: 5.0,
                    ),
                    BoxShadow(
                      color: colorScheme.background,
                      offset: const Offset(0, 0),
                      spreadRadius: 10.0,
                      blurRadius: 0.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, right: 12.0, left: 12.0, bottom: 12.0),
                child: Row(
                  children: [
                    OutlinedButton.icon(
                        // style: FilledButton.styleFrom(
                        //     backgroundColor: colorScheme.tertiary),
                        onPressed: () => onCancel(context),
                        icon: const Icon(Icons.cancel),
                        label: Text(
                          translate('cancel'),
                          // style: TextStyle(
                          //   color: colorScheme.onTertiary,
                          // )
                        )),
                    const Spacer(),
                    FilledButton.icon(
                      onPressed: () => onSubmit(context),
                      icon: const Icon(Icons.done),
                      label: const Text(
                        'Ok',
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
