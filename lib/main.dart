import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'component/component.dart';
import 'models/listpatient.dart';
import 'models/listsettings.dart';
import 'screens/homepage.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(PatientsAdapter());
  Hive.registerAdapter(ListNoteAdapter());
  await Hive.openBox<Settings>('Settings');
  await Hive.openBox<Patients>('Patient');
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
      title: 'MedicalNote ',
      theme: ThemeData(scaffoldBackgroundColor: kDefaultcolor),
      home: const HomePage(),
    );
  }
}
