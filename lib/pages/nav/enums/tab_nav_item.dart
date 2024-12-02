import 'package:flutter/material.dart';

enum TabNavItem {
  home,
  settings;

  String get localizedTitle {
    switch (this) {
      case TabNavItem.home:
        return "Home";
      case TabNavItem.settings:
        return "Settings";
    }
  }

  BottomNavigationBarItem buildOption(int indexSelected) {
    switch (this) {
      case TabNavItem.home:
        return BottomNavigationBarItem(
          icon: buildIcon(Icons.home, indexSelected),
          label: localizedTitle,
        );
      case TabNavItem.settings:
        return BottomNavigationBarItem(
          icon: buildIcon(Icons.settings, indexSelected),
          label: localizedTitle,
        );
    }
  }

  //Helpers
  Widget buildIcon(IconData iconData, int indexSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Icon(iconData),
    );
  }
}
