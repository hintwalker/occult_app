import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaleAvatarWidget extends StatelessWidget {
  const MaleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/male.svg',
      package: 'tauari_ui',
    );
  }
}
