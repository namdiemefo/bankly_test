import 'package:bankly_test/ui/login/login_page.dart';
import 'package:bankly_test/ui/pages/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'db/prefs.dart';
import 'helpers/service_locator.dart';
import 'main_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  setUpLocator();
  Bloc.observer = MainBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bankly Test',
      theme: ThemeData(
        fontFamily: "ProximaNova",
        appBarTheme: AppBarTheme(
            color: Color(0xFF100D3B)
        ),
        // primarySwatch: Colors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF25E0D3)),
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                      color: Color(0xFF25E0D3)
                  )
              )
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF100D3B)),
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF25E0D3)),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Color(0xFF100D3B)))
          ),
        ),
        textTheme: TextTheme(
            bodyText2: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 12.0,
                color: Color(0xFF100D3B)
            ),
            bodyText1: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 12.0,
                color: Color(0xFF100D3B)
            )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: sharedPrefs.email == null || sharedPrefs.email.isEmpty ? LoginPage() : CarouselPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
