part of tauari_ui;

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
      decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          image: DecorationImage(
              image: path == null
                  ? gender == 0
                      ? const AssetImage('assets/icons/girl.png',
                          package: 'tauari_ui')
                      : const AssetImage('assets/icons/man.png',
                          package: 'tauari_ui')
                  : Image.file(File.fromUri(Uri.file(path!))).image,
              fit: fit)),
    );
  }
}
