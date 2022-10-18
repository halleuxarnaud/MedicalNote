import 'package:flutter/material.dart';

class Patients {
  final String name;
  final List<ListNote>? listOfNotes;
  final String firstname;
  final String dateofbirth;
  final String email;
  final String numero;
  final String id;
  final DateTime date;

  Patients(
      {required this.name,
      required this.firstname,
      required this.dateofbirth,
      required this.email,
      required this.numero,
      required this.id,
      required this.date,
      this.listOfNotes});
}

class ListNote {
  final String? title;
  final String? note;
  final String? conclusion;

  ListNote({
    this.title,
    this.note,
    this.conclusion,
  });
}

final List<Patients> patientList = [
  Patients(
    name: 'Halleux',
    firstname: 'Arnaud',
    dateofbirth: '***********',
    email: '***********',
    numero: '***********',
    date: DateTime.now(),
    id: '080283820',
    listOfNotes: [
      ListNote(
          title: 'Test0',
          note: 'djdojzodjojdiozjdoizdozdzhdhzdhzdhzdhzdh',
          conclusion: 'Je suis pas malade'),
      ListNote(
        title: 'Test1',
        note:
            'Hello jsssjsjsjsjsjsjsjsjsjsjsjsjsjsjsjdzdjzpdjzjiazdozaoidhzodhoazhdouzhdozahdouazhduozahuodhzaudhzahdmazhdzhdhazhdomzahdmzahmdzhamdhzadhzamdhiazhdiahz',
        conclusion: 'Je suis malade',
      )
    ],
  ),
];
