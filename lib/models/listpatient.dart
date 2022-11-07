import 'package:hive_flutter/hive_flutter.dart';

part 'listpatient.g.dart';

@HiveType(typeId: 0)
class Patients {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? firstname;

  @HiveField(3)
  final String? dateofbirth;

  @HiveField(4)
  final String? email;

  @HiveField(5)
  final String? numero;

  @HiveField(6)
  final DateTime? date;

  @HiveField(7)
  final int? id;

  @HiveField(8)
  final List<ListNote>? listOfNotes;

  const Patients({
    this.name,
    this.firstname,
    this.dateofbirth,
    this.email,
    this.numero,
    this.date,
    this.id,
    this.listOfNotes,
  });
}

@HiveType(typeId: 10)
class ListNote {
  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? note;

  @HiveField(3)
  final String? conclusion;

  ListNote({
    this.title,
    this.note,
    this.conclusion,
  });
}

/*
final List<Patients> patientList = [
  Patients(
    name: 'Halleux',
    firstname: 'Arnaud',
    dateofbirth: '***********',
    email: '***********',
    numero: '***********',
    date: DateTime.now(),
    id: 5252522,
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
*/