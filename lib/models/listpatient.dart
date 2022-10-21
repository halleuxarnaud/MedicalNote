class Patients {
  final String name;
  final String firstname;
  final String dateofbirth;
  final String email;
  final String numero;
  //final String id;
  final DateTime? date;
  //final List<ListNote>? listOfNotes;

  Patients({
    required this.name,
    required this.firstname,
    required this.dateofbirth,
    required this.email,
    required this.numero,
    //required this.id,
    this.date,
    //this.listOfNotes,
  });

  Patients.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        firstname = json['firstname'],
        dateofbirth = json['dateofbirth'],
        email = json['email'],
        numero = json['numero'],
        date = json['date'];
  //id = json['id'];
  //listOfNotes = json['listofnotes']

  Map<String, dynamic> toJson() => {
        'name': name,
        'firstname': firstname,
        'dateofbirth': dateofbirth,
        'email': email,
        'numero': numero,
        'date': date,
        //'id': id,
        //'listOfNotes': listOfNotes
      };
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
    // id: '080283820',
    /*
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
    */
  ),
];
