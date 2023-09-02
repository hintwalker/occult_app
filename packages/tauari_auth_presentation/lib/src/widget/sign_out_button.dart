import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.logout),
      label: Text(title),
    );
  }
}
