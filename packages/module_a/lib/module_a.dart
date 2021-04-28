library module_a;

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ModuleA implements Module {
  @override
  String get moduleName => 'Module A';

  @override
  Map<String, WidgetBuilderWithArgs> get routes => {
        '/homeA': (context, args) => Home(title: moduleName),
      };
}

class Home extends StatefulWidget {
  final String title;

  const Home({
    Key? key,
    this.title = '',
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
