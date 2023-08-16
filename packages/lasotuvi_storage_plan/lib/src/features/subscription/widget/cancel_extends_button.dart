import 'package:flutter/material.dart';

// import '../../style/storage_plan_style.dart';

class CancelExtendsButton extends StatelessWidget {
  const CancelExtendsButton({
    super.key,
    required this.translate,
    // required this.style,
    required this.onTap,
  });
  final String Function(String) translate;
  // final StoragePlanStyle style;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(
        translate('cancelExtends'),
      ),
    );
  }
}
