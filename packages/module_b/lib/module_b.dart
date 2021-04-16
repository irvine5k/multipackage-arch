library module_b;

import 'package:core/core.dart';
import 'package:core/event_bus.dart';
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
    Key key,
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

class Trigger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.red,
      child: Text('Mandar Mensagem'),
      onPressed: () => AppEventBus.emit(HomeEvent(Text('oi'))),
    );
  }
}

class HomeEvent implements Event {
  final Widget widget;

  HomeEvent(this.widget);

  @override
  Widget get message => widget;
}
