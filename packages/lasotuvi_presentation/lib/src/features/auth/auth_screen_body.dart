import 'package:flutter/material.dart';
import 'user_auth_widget.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: UserAuthWidget());
  }
}
