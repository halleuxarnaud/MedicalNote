import 'package:MedicalNote/controller/new_patient.dart';
import 'package:flutter/material.dart';

class PatientList extends StatefulWidget {
  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  void _addPatient(String newname, String newfirstname, String newdateofbirth,
      String newemail, String newnumero) {
    final newPT = Patients(
      name: newname,
      firstname: newfirstname,
      dateofbirth: newdateofbirth,
      email: newemail,
      numero: newnumero,
      date: DateTime.now(),
      //id: DateTime.now().toString(),
      //listOfNotes: [],
    );

    setState(() {
      patientList.add(newPT);
    });
  }

  void _bottomnewpatient(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NewPatient(_addPatient),
              behavior: HitTestBehavior.opaque);
        });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: NewPatient(_addPatient),
    );
  }
}
