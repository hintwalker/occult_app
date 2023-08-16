import 'package:flutter/material.dart';

class NoteEnoughEnergyDialog extends StatelessWidget {
  const NoteEnoughEnergyDialog({
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 36.0,
      ),
      contentPadding: const EdgeInsets.all(24.0),
      content: SingleChildScrollView(
        child: Text(translate('notEnoughEnergy'),
            style: const TextStyle(
              fontSize: 20,
            )),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            translate('close'),
          ),
        ),
      ],
    );
  }
}
