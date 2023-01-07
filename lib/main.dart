import 'package:alarm/screens/alarm.dart';
import 'package:alarm/screens/setAlarm.dart';
import 'package:alarm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{'/setAlarm': (_) => new setAlarm()},
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "鬧鐘",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Alarm(),
      ),
    );
  }
}
