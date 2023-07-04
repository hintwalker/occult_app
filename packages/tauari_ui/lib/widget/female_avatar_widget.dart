part of tauari_ui;

class FemaleAvatarWidget extends StatelessWidget {
  const FemaleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/female.svg',
      package: 'tauari_ui',
    );
  }
}
