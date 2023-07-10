import 'dart:io';

import 'package:flutter/material.dart';

import 'female_avatar_widget.dart';
import 'male_avatar_widget.dart';

class CircleHumanAvatar extends StatelessWidget {
  const CircleHumanAvatar({
    super.key,
    required this.gender,
    this.path,
    this.size = 36,
    this.fit = BoxFit.fill,
  });
  final String? path;
  final int gender;
  final double size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        // image: DecorationImage(
        //     image: path == null
        //         ? gender == 0
        //             ? const AssetImage('assets/icons/girl.png',
        //                 package: 'tauari_ui')
        //             : const AssetImage('assets/icons/man.png',
        //                 package: 'tauari_ui')
        //         : Image.file(File.fromUri(Uri.file(path!))).image,
        //     fit: fit)
      ),
      child: getAvatar(path, gender),
    );
  }

  Widget getAvatar(String? path, int gender) {
    return path == null || path.isEmpty
        ? gender == 0
            ? const FemaleAvatarWidget()
            : const MaleAvatarWidget()
        : ClipOval(
            child: Image.file(
              File.fromUri(Uri.file(path)),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => gender == 0
                  ? const FemaleAvatarWidget()
                  : const MaleAvatarWidget(),
            ),
          );
  }
}
