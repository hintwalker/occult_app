part of lasotuvi_presentation;

class LibraryScreenBody extends ConsumerStatefulWidget {
  const LibraryScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LibraryScreenBodyState();
}

class _LibraryScreenBodyState extends AuthDependedState<LibraryScreenBody> {
  @override
  Widget build(BuildContext context) {
    return StarInfoViewer(
      'tu_vi',
      themeData: AppTheme.light(),
    );
  }
}
