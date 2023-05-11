part of lasotuvi_presentation;

class RouterNotifer extends AutoDisposeAsyncNotifier<bool>
    implements Listenable {
  VoidCallback? routerListener;

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  Future<bool> build() async {
    return Future.value(true);
    // final isAuth = await ref.watch(
    //   authNotifierProvider.selectAsync((data) => data != null),
    // );

    // ref.listenSelf((_, __) {
    //   if (state.isLoading) return;
    //   routerListener?.call();
    // });
    // return isAuth;
  }

  String? redirect(BuildContext context, GoRouterState state) {
    // final isSplash = state.location == RoutePath.splash;
    // if (isSplash) {
    //   await Future.delayed(const Duration(seconds: 2));
    //   // Kiem tra neu la lan chay dau tien
    //   // Thi hien thiflu welcome screen
    //   if (await isFirstCall()) {
    //     return RoutePath.welcome;
    //   }
    //   return RoutePath.dashboard;
    // }
    return null;
    // final isAuth = this.state.valueOrNull;
    // if (isAuth == null) return RoutePath.signIn;
    // final isSplash = state.location == RoutePath.splash;
    // if (isSplash) {
    //   return isAuth ? RoutePath.home : RoutePath.signIn;
    // }
    // final isSignIn = state.location == RoutePath.signIn;
    // if (isSignIn) return isAuth ? RoutePath.home : null;
    // return isAuth ? null : RoutePath.splash;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
