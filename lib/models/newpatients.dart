class Patients {
  final String name;
  final String firstname;
  final String dateofbirth;
  final String email;
  final String numero;
  final String id;
  final DateTime date;
  String? anamenese;

  Patients(
      {required this.name,
      required this.firstname,
      required this.dateofbirth,
      required this.email,
      required this.numero,
      required this.id,
      required this.date,
      this.anamenese});
}

final List<Patients> patientList = [
  Patients(
    name: 'Halleux',
    firstname: 'Arnaud',
    dateofbirth: '20/02/1998',
    email: 'Halleuxarnaud4@gmail.com',
    numero: '0472308913',
    date: DateTime.now(),
    id: '080283820',
  ),
  Patients(
    name: 'Perillo',
    firstname: 'Stéphanie',
    dateofbirth: '20/02/1998',
    email: 'stéphanie.perillo.be',
    numero: '0472389856',
    date: DateTime.now(),
    id: '678565789789',
  ),
];
