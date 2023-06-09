import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../drawer_data.dart';
import '../../drawer_style.dart';
import '../drawer_panel.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
    required this.header,
    required this.screen,
    required this.title,
    required this.menus,
    required this.style,
    this.appBarTrailing,
  });

  final Widget Function(String id) screen;
  final Widget Function(String id) title;
  final Widget header;
  final Iterable<DrawerData> menus;
  final DrawerStyle style;
  final Widget? appBarTrailing;

  @override
  State<DrawerWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DrawerWidget> with TickerProviderStateMixin {
  AnimationController? animationController;
  String screenId = 'home';
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
        key: _sliderDrawerKey,
        appBar: SliderAppBar(
          title: widget.title(screenId),
          drawerIconColor: widget.style.menuIconColor,
          trailing: widget.appBarTrailing,
        ),
        slider: DrawerPanel(
          header: widget.header,
          menus: widget.menus,
          onMenuTap: _onMenuTap,
          style: widget.style,
          selectedId: screenId,
          // animationController: animationController!,
        ),
        animationDuration: 250,
        sliderBoxShadow: SliderBoxShadow(color: widget.style.boxShadowColor),
        child: widget.screen(screenId));
  }

  void _onMenuTap(DrawerData data) {
    setState(() {
      screenId = data.id;
    });
    _sliderDrawerKey.currentState?.closeSlider();
  }
}
