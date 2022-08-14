import 'package:flutter/material.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:saber/pages/home/home.dart';

// workaround to assign strings as enum values
abstract class RoutePaths {
  static const root = "/";
  static const home = "/home/:subpage";
  static const edit = "/edit";
  static const login = "/login";
  static get all => [root, home, edit];
}

abstract class HomeRoutes {
  static PathFunction homeFunction = pathToFunction(RoutePaths.home);

  static final _routes = <_Route>[
    _Route(
      routePath: homeFunction({"subpage": HomePage.recentSubpage}),
      label: 'Home',
      icon: const Icon(Icons.home),
    ),
    _Route(
      routePath: homeFunction({"subpage": HomePage.browseSubpage}),
      label: 'Browse',
      icon: const Icon(Icons.notes),
    ),
    _Route(
      routePath: homeFunction({"subpage": HomePage.settingsSubpage}),
      label: 'Settings',
      icon: const Icon(Icons.settings),
    ),
  ];

  static String getRoute(int index) {
    return _routes[index].routePath;
  }

  static get navigationDestinations => _routes
      .map((e) => e.toNavigationDestination())
      .toList(growable: false);
  static get navigationRailDestinations => _routes
      .map((e) => e.toNavigationRailDestination())
      .toList(growable: false);
}

class _Route {
  final String routePath;
  final String label;
  final Icon icon;

  _Route({
    required this.routePath,
    required this.label,
    required this.icon,
  });

  NavigationDestination toNavigationDestination() => NavigationDestination(
    label: label,
    icon: icon,
  );
  NavigationRailDestination toNavigationRailDestination() => NavigationRailDestination(
    label: Text(label),
    icon: icon,
  );
}
