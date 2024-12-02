import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_flutter/pages/nav/enums/tab_nav_item.dart';
import 'package:introduction_flutter/router/router.dart';
import 'package:introduction_flutter/theme/app_colors.dart';

class TabNavPage extends StatefulWidget {
  const TabNavPage({Key? key}) : super(key: key);

  @override
  State<TabNavPage> createState() => _TabNavPageState();
}

class _TabNavPageState extends State<TabNavPage> {
  @override
  Widget build(context) {
    List<PageRouteInfo<dynamic>> routes = [
      const HomeTab(),
      const SettingsTab(),
    ];

    return AutoTabsRouter.pageView(
      routes: routes,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, animation) {
        return Scaffold(
          body: child,
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        );
      },
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          elevation: 10,
          backgroundColor: Colors.white,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) =>
              setActiveIndex(tabsRouter, tabsRouter.activeIndex, index),
          selectedItemColor: AppColors.fucsia,
          unselectedItemColor: Colors.black,
          selectedFontSize: 12,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: Colors.black,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
          type: BottomNavigationBarType.fixed,
          items: TabNavItem.values
              .map((e) => e.buildOption(tabsRouter.activeIndex))
              .toList(),
        ),
      ),
    );
  }

  setActiveIndex(TabsRouter tabsRouter, int oldIndex, int index) async {
    tabsRouter.setActiveIndex(index);
  }
}
