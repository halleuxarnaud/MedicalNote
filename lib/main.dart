import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'component/component.dart';
import 'models/listpatient.dart';
import 'models/listsettings.dart';
import 'screens/homepage.dart';

//! *************************************************************//
//* changer le nom avec license des svg
//* changer la license github pour qu'on ne puisse pas prendre mon code pour le commercionaliser
//! Rendre plus beau la page list-patient
//! Retirer la function on chnager des text form pour éviter qu'il ne valide tout les info alors qui reste des chose a valider
//! Trouver un moyen d'utiliser la function qui est dans une autre methode
//! Suppression des notes patients
//! Ajouter un setstate sur la page de nouvelle note
//! Ajouter un pdf Viuwver
//! *************************************************************//

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(ListInstitutionAdapter());
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
      title: 'MedicalNote',
      theme: ThemeData(scaffoldBackgroundColor: kDefaultcolor),
      home: HomePage(),
    );
  }
}
