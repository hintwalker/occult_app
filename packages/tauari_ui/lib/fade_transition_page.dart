part of tauari_ui;

class FadeTransitionPage<T> extends Page<T> {
  final Widget child;
  final Duration duration;

  const FadeTransitionPage({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) =>
      PageBasedFadeTransitionRoute<T>(this);
}

class PageBasedFadeTransitionRoute<T> extends PageRoute<T> {
  PageBasedFadeTransitionRoute(FadeTransitionPage<T> page)
      : super(settings: page);

  FadeTransitionPage<T> get _page => settings as FadeTransitionPage<T>;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => _page.duration;

  @override
  Duration get reverseTransitionDuration => _page.duration;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _page.child;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = CurveTween(curve: Curves.easeInOutQuint);
    return FadeTransition(
      opacity: animation.drive(tween),
      child: _page.child,
    );
  }
}
