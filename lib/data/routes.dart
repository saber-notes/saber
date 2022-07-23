import 'package:flutter/material.dart';

// workaround to assign strings as enum values
abstract class RoutePaths {
  static const root = "/";
  static const browse = "/browse";
  static const settings = "/settings";
  static get all => [root, browse, settings];
}

abstract class HomeRoutes {
  static final _routes = <_Route>[
    _Route(
      routePath: RoutePaths.root,
      label: 'Home',
      icon: const Icon(Icons.home),
    ),
    _Route(
      routePath: RoutePaths.browse,
      label: 'Notes',
      icon: const Icon(Icons.notes),
    ),
    _Route(
      routePath: RoutePaths.settings,
      label: 'Settings',
      icon: const Icon(Icons.settings),
    ),
  ];

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
