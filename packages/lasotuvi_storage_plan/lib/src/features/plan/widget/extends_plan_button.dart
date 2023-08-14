import 'package:flutter/material.dart';

class ExtendsPlanButton extends StatelessWidget {
  const ExtendsPlanButton({
    super.key,
    required this.translate,
    required this.onTap,
  });

  final String Function(String) translate;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      child: Text(
        translate('extendsNow'),
      ),
    );
  }
}
