import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_flutter/pages/home/home_page.dart';
import 'package:introduction_flutter/pages/nav/tab_nav_page.dart';
import 'package:introduction_flutter/pages/onboarding/onboarding_page.dart';
import 'package:introduction_flutter/pages/recipes/recipe_detail_page.dart';
import 'package:introduction_flutter/pages/settings/settings_page.dart';
part 'router.gr.dart';

///if you want the generator to run one time and exits use: "dart run build_runner build"

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
      path: '/onboarding_page',
      page: OnboardingPage,
      initial: true,
    ),
    CustomRoute(
      path: '/nav',
      page: TabNavPage,
      children: [
        CustomRoute(
          initial: true,
          path: 'home',
          page: HomePage,
          name: 'HomeTab',
        ),
        CustomRoute(
          path: 'settings',
          page: SettingsPage,
          name: 'settingsTab',
        ),
      ],
    ),
    CustomRoute(
      path: '/recipe_detail_page',
      page: RecipeDetailPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}

extension ReplaceAllNamed on StackRouter {
  Future<void> replaceAllNamed(
    String path, {
    bool includePrefixMatches = false,
    OnNavigationFailure? onFailure,
  }) {
    popUntilRoot();
    return navigateNamed(path,
        includePrefixMatches: includePrefixMatches, onFailure: onFailure);
  }
}
