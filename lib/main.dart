import 'package:flutter/material.dart';
import 'package:newcalendar/component/component.dart';
import 'package:newcalendar/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewCalendar',
      theme: ThemeData(scaffoldBackgroundColor: kDefaultcolor),
      home: HomePage(),
    );
  }
}
