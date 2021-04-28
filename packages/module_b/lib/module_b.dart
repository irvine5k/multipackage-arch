library module_b;

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ModuleB implements Module {
  @override
  String get moduleName => 'Module B';

  @override
  Map<String, WidgetBuilderWithArgs> get routes => {
        '/homeB': (context, args) => Home(title: moduleName),
      };
}

class Home extends StatelessWidget {
  final String title;

  const Home({
    Key? key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Text(title),
      ),
    );
  }
}
