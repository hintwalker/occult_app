import 'package:flutter/material.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({
    super.key,
    required this.translate,
  });
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.done,
        color: Colors.green,
        size: 36,
      ),
      contentPadding: const EdgeInsets.all(24.0),
      content: SingleChildScrollView(
        child: Text(translate('paymentSuccess'),
            style: const TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}
