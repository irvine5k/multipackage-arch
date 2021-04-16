import 'package:core/core.dart';
import 'package:core/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:module_a/module_a.dart';
import 'package:module_b/module_b.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget with App {
  MyApp({
    Key key,
  }) : super(key: key) {
    initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: generateRoutes,
    );
  }

  @override
  Map<String, WidgetBuilderWithArgs> get mainRoutes => {};

  @override
  List<Module> get modules => [
        ModuleA(),
        ModuleB(),
      ];
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int countA = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NotificationListener<CountNotification>(
              onNotification: (notification) {
                setState(
                  () => countA = notification.count,
                );

                return true;
              },
              child: Column(
                children: [
                  Text('Count A: $countA'),
                  const SizedBox(height: 20),
                  CounterWidget(),
                ],
              ),
            ),
            TextButton(
              child: Text(
                'HomeA',
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                '/homeA',
              ),
            ),
            Trigger(),
            StreamBuilder<Event>(
              stream: AppEventBus.instance.eventBus,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data is HomeEvent) {
                  return (snapshot.data as HomeEvent).message;
                }

                return Container();
              },
            ),
            TextButton(
              child: Text(
                'HomeB',
              ),
              onPressed: () => Navigator.pushNamed(context, '/homeB'),
            ),
          ],
        ),
      ),
    );
  }
}
