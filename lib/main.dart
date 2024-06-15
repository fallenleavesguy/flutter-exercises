import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exercises/routes/chess_route.dart';
import 'package:flutter_exercises/routes/nested_scroll_issue.dart';
import 'package:flutter_exercises/routes/nested_scroll_view-example.dart';
import 'package:flutter_exercises/routes/nested_tabbar_view.dart';
import 'package:flutter_exercises/routes/print_snap_nested_scroll_header.dart';
import 'package:flutter_exercises/routes/sticky_header.dart';
import 'package:flutter_exercises/routes/turnbox_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          buildItem(context,
            child: Text("演示滚动视图嵌套问题"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NestedScrollIssue(),
                ),
              );
            },
          ),
          buildItem(context,
            child: Text("演示滚动视图嵌套简单用法"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NestedScrollViewExample(),
                ),
              );
            },
          ),
          buildItem(context,
            child: Text("演示输出滚动视图嵌套头部同步占用高度"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SnapAppBar2(),
                ),
              );
            },
          ),
          buildItem(context,
            child: Text("演示嵌套TabBar"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NestedTabBarView1(),
                ),
              );
            },
          ),
          buildItem(context,
            child: Text("演示Turnbox"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const TurnBoxRoute(),
                ),
              );
            },
          ),
          buildItem(context,
            child: Text("演示画棋盘"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ChessRoute(),
                ),
              );
            },
          ),
          buildItem(context,
            child: Text("演示StickyHeader"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => StickyHeaderExample(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, {
    required Widget child, void Function()? onTap
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.yellow[500],
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
