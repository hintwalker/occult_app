import 'package:flutter/material.dart';

import '../auth/user_auth_widget.dart';

class TuviDrawerHeader extends StatelessWidget {
  const TuviDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        UserAuthWidget()
      ],
    );
  }
}
