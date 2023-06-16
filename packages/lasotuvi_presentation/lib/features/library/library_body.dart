part of lasotuvi_presentation;

class LibraryBody extends ConsumerStatefulWidget {
  const LibraryBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryBodyState();
}

class _LibraryBodyState extends AuthDependedState<LibraryBody> {
  @override
  Widget build(BuildContext context) {
    return StarInfoViewer(
      'tu_vi',
      themeData: AppTheme.light(),
    );
  }
}
