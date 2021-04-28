import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:module_a/module_a.dart';
import 'package:module_b/module_b.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with App {
  MyApp() {
    // initRoutes();
  }

  @override
  List<Module> get modules => [
        ModuleA(),
        ModuleB(),
      ];

  @override
  Widget build(BuildContext context) => MaterialApp(
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = ''}) : super(key: key);

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
            TextButton(
              child: Text(
                'HomeA',
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                '/homeA',
              ),
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
