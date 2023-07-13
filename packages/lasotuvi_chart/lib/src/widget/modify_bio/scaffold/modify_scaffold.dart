import 'package:flutter/material.dart';

class ModifyScaffold extends StatelessWidget {
  const ModifyScaffold({
    super.key,
    required this.translate,
    required this.body,
    required this.onSubmit,
  });
  final Widget body;
  final String Function(String) translate;
  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      body,
      const SizedBox(
        height: 32.0,
      ),
      SizedBox(
        height: 48.0,
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  translate('cancel'),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: onSubmit,
                child: const Text('Ok'),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
