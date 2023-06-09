import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../controller/tauari_drawer_controller.dart';
import '../../drawer_data.dart';
import '../../drawer_style.dart';
import '../drawer_panel.dart';

class DrawerScaffold extends StatefulWidget {
  const DrawerScaffold({
    super.key,
    required this.header,
    required this.child,
    required this.title,
    required this.menus,
    required this.style,
    this.appBarTrailing,
    required this.onMenuTap,
    required this.controller,
    this.appBarHeight = 84.0,
    this.appBarPadding = const EdgeInsets.only(top: 36.0),
  });

  final TauariDrawerController controller;
  final Widget child;
  final Widget Function(String id) title;
  final Widget header;
  final Iterable<DrawerData> menus;
  final DrawerStyle style;
  final Widget? appBarTrailing;
  final void Function(String id) onMenuTap;
  final double appBarHeight;
  final EdgeInsets appBarPadding;

  @override
  State<DrawerScaffold> createState() => _DrawerScaffoldState();
}

class _DrawerScaffoldState extends State<DrawerScaffold> {
  // AnimationController? animationController;
  String screenId = 'home';
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);

    // animationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 0));
  }

  void listenToController() {
    _onMenuTap(widget.controller.screenId);
  }

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
        key: _sliderDrawerKey,
        appBar: SliderAppBar(
          appBarPadding: widget.appBarPadding,
          appBarHeight: widget.appBarHeight,
          title: widget.title(screenId),
          drawerIconColor: widget.style.menuIconColor,
          trailing: widget.appBarTrailing,
          appBarColor: widget.style.appBarColor,
        ),
        slider: DrawerPanel(
          header: widget.header,
          menus: widget.menus,
          onMenuTap: (data) => _onMenuTap(data.id),
          style: widget.style,
          selectedId: screenId,
        ),
        animationDuration: 250,
        sliderBoxShadow: SliderBoxShadow(color: widget.style.boxShadowColor),
        child: widget.child);
  }

  void _onMenuTap(String id) {
    widget.onMenuTap(id);
    setState(() {
      screenId = id;
    });
    _sliderDrawerKey.currentState?.closeSlider();
  }
}
