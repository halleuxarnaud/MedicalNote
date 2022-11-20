import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'component/component.dart';
import 'models/listpatient.dart';
import 'models/listsettings.dart';
import 'screens/homepage.dart';

//! Suppression des patient
//! Suppression des notes patients
//! Ajouter l'option de recherche
//! Ajouter Tout les parametre dans la page parametre
//! Ajouter a "Download PDF " une flèche fers le bas a gauche du texte

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PatientsAdapter());
  Hive.registerAdapter(ListNoteAdapter());
  Hive.registerAdapter(ListInstitutionAdapter());
  Hive.registerAdapter(SettingsAdapter());
  await Hive.openBox<Patients>('Patient');
  await Hive.openBox<Settings>('Settings');
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
