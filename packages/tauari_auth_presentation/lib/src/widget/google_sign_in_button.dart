import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.onTap,
    this.title,
  });
  final void Function() onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: title == null
          ? IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.g_mobiledata),
            )
          : ElevatedButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.g_mobiledata),
              label: Text(title!),
            ),
    );
  }
}
