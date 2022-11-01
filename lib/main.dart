import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'component/component.dart';
import 'models/listpatient.dart';
import 'screens/homepage.dart';

void main() async {
  //!Initialisation HIVE
  await Hive.initFlutter();
  Hive.registerAdapter(PatientsAdapter());
  await Hive.openBox<Patients>('Patient');
  //await Hive.openBox<Settings>('boxPatient');
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
      title: 'MedicalNote',
      theme: ThemeData(scaffoldBackgroundColor: kDefaultcolor),
      home: HomePage(),
    );
  }
}
