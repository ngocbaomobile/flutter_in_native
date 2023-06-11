import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

@pragma('vm:entry-point')
void topMain() => runApp(const MyApp(themColor: Colors.green));

@pragma('vm:entry-point')
void bottomMain() => runApp(const MyApp(themColor: Colors.purple));

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.themColor});
  final Color? themColor;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: themColor)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('multiple-flutters');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              behavior: HitTestBehavior.opaque,
              child: Icon(Icons.arrow_back_ios_new_rounded)),
          automaticallyImplyLeading: true,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text('flutter screen'),
              ElevatedButton(
                  onPressed: () async {
                    var data = await platform.invokeMethod('getBatteryLevel');
                    print(data);
                  },
                  child: Text('call native'))
            ],
          ),
        ));
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }
}
