import 'package:flutter/material.dart';

class ContinueExtendsButton extends StatelessWidget {
  const ContinueExtendsButton({
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
        translate('continueExtends'),
      ),
    );
  }
}
