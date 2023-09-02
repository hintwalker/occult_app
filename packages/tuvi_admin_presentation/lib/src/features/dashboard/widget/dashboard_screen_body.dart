import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
// import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_admin_presentation/src/features/appbar/main_app_bar.dart';
import 'package:tuvi_admin_presentation/src/features/chart/navigator/chart_navigator.dart';
import 'package:tuvi_admin_presentation/src/style/admin_app_style.dart';

import '../../home/widget/home_screen_body.dart';

// import 'custom_search_delegate.dart';

class DashboardScreenBody extends StatefulWidget {
  const DashboardScreenBody({super.key});

  @override
  State<DashboardScreenBody> createState() => _DashboardScreenBodyState();
}

class _DashboardScreenBodyState extends State<DashboardScreenBody> {
  PageController controller = PageController();
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const MainAppbar(),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          inkEffect: true,
          inkColor: AdminAppStyle.colorScheme.outline,
          unselectedIconColor: AdminAppStyle.colorScheme.outline,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: Icon(
              Icons.house_rounded,
              color: AdminAppStyle.colorScheme.primary,
            ),
            unSelectedColor: AdminAppStyle.colorScheme.outline,
            selectedColor: AdminAppStyle.colorScheme.primary,
            backgroundColor: AdminAppStyle.colorScheme.primaryContainer,
            title: Text(
              'Home',
              style: TextStyle(
                  color: AdminAppStyle.colorScheme.primary, letterSpacing: 1.2),
            ),
            // badge: const Text('9+'),
            showBadge: false,
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.notifications_outlined,
              ),
              selectedIcon: Icon(
                Icons.notifications,
                color: AdminAppStyle.colorScheme.primary,
              ),
              unSelectedColor: AdminAppStyle.colorScheme.outline,
              selectedColor: AdminAppStyle.colorScheme.primary,
              backgroundColor: AdminAppStyle.colorScheme.primaryContainer,
              title: Text(
                'notification',
                style: TextStyle(
                    color: AdminAppStyle.colorScheme.primary,
                    letterSpacing: 1.2),
              ),
              badge: Text(
                '9+',
                style: TextStyle(color: AdminAppStyle.colorScheme.onError),
              ),
              showBadge: true,
              badgeRadius: BorderRadius.circular(12.0),
              badgeColor: AdminAppStyle.colorScheme.error),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.end,
        currentIndex: selectedIndex ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ChartNavigator.openChartCreationScreen(context);
        },
        backgroundColor: AdminAppStyle.colorScheme.tertiaryContainer,
        child: Icon(
          Icons.add,
          color: AdminAppStyle.colorScheme.onTertiaryContainer,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeScreenBody(),
            Center(child: Text('Notification')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
