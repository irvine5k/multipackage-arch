library core;

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

typedef WidgetBuilderWithArgs = Widget Function(
    BuildContext context, Object? args);

abstract class Module {
  String get moduleName;

  Map<String, WidgetBuilderWithArgs> get routes;
}

abstract class App {
  List<Module> get modules;

  late final Map<String, WidgetBuilderWithArgs> _routes = _getAllRoutes();

  Map<String, WidgetBuilderWithArgs> _getAllRoutes() {
    Map<String, WidgetBuilderWithArgs> allRoutes = {};

    if (modules.isNotEmpty) {
      for (final module in modules) {
        final routes = module.routes;
        allRoutes.addAll(routes);
      }
    }

    return allRoutes;
  }

  Route<Object> generateRoutes(RouteSettings settings) {
    final routeName = settings.name;
    final routeArguments = settings.arguments;

    final route = _routes[routeName!];

    return MaterialPageRoute(
      builder: (context) =>
          route?.call(context, routeArguments) ??
          Container(
            child: Text('Empty Route'),
          ),
    );
  }
}
