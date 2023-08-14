import 'package:flutter/material.dart';

class Billing extends StatelessWidget {
  const Billing({
    super.key,
    required this.bill,
    required this.translate,
    this.iconColor,
    this.billingTitleTextStyle,
    this.billingValueTextStyle,
    this.backgroundColor,
  });
  final int bill;
  final String Function(String) translate;
  final Color? iconColor;
  final TextStyle? billingTitleTextStyle;
  final TextStyle? billingValueTextStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            translate('youMustPay'),
            style: billingTitleTextStyle,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Icon(
            Icons.energy_savings_leaf_outlined,
            color: iconColor,
          ),
          const SizedBox(
            width: 2.0,
          ),
          Text(
            '$bill',
            style: billingValueTextStyle,
          ),
        ],
      ),
    );
  }
}
