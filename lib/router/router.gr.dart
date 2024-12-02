// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TabNavRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const TabNavPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RecipeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: RecipeDetailPage(
          key: args.key,
          title: args.title,
        ),
        transitionsBuilder: TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeTab.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SettingsTab.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/onboarding_page',
          fullMatch: true,
        ),
        RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding_page',
        ),
        RouteConfig(
          TabNavRoute.name,
          path: '/nav',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: TabNavRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeTab.name,
              path: 'home',
              parent: TabNavRoute.name,
            ),
            RouteConfig(
              SettingsTab.name,
              path: 'settings',
              parent: TabNavRoute.name,
            ),
          ],
        ),
        RouteConfig(
          RecipeDetailRoute.name,
          path: '/recipe_detail_page',
        ),
      ];
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding_page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [TabNavPage]
class TabNavRoute extends PageRouteInfo<void> {
  const TabNavRoute({List<PageRouteInfo>? children})
      : super(
          TabNavRoute.name,
          path: '/nav',
          initialChildren: children,
        );

  static const String name = 'TabNavRoute';
}

/// generated route for
/// [RecipeDetailPage]
class RecipeDetailRoute extends PageRouteInfo<RecipeDetailRouteArgs> {
  RecipeDetailRoute({
    Key? key,
    required String title,
  }) : super(
          RecipeDetailRoute.name,
          path: '/recipe_detail_page',
          args: RecipeDetailRouteArgs(
            key: key,
            title: title,
          ),
        );

  static const String name = 'RecipeDetailRoute';
}

class RecipeDetailRouteArgs {
  const RecipeDetailRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'RecipeDetailRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [HomePage]
class HomeTab extends PageRouteInfo<void> {
  const HomeTab()
      : super(
          HomeTab.name,
          path: 'home',
        );

  static const String name = 'HomeTab';
}

/// generated route for
/// [SettingsPage]
class SettingsTab extends PageRouteInfo<void> {
  const SettingsTab()
      : super(
          SettingsTab.name,
          path: 'settings',
        );

  static const String name = 'SettingsTab';
}
