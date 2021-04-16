library core;

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

typedef WidgetBuilderWithArgs = Widget Function(
    BuildContext context, Object args);

abstract class Module {
  String get moduleName;

  Map<String, WidgetBuilderWithArgs> get routes;
}

abstract class App {
  List<Module> get modules;

  Map<String, WidgetBuilderWithArgs> get mainRoutes;

  final Map<String, WidgetBuilderWithArgs> routes = {};

  void initRoutes() {
    print('INIT ROUTES');
    if (mainRoutes?.isNotEmpty ?? false) {
      routes.addAll(mainRoutes);
    }

    print('Modules:');
    if (modules?.isNotEmpty ?? false) {
      for (final module in modules) {
        print(module.moduleName);
        routes.addAll(module.routes);
      }
    }

    print('Routes: $routes');
  }

  Route<Object> generateRoutes(RouteSettings settings) {
    final routeName = settings.name;
    final routeArguments = settings.arguments;

    final route = routes[routeName];

    return MaterialPageRoute(
      builder: (context) =>
          route?.call(context, routeArguments) ??
          Container(
            child: Text('Empty Route'),
          ),
    );
  }
}
