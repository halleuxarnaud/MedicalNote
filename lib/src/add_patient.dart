import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newcalendar/models/newpatients.dart';

import 'new_patient.dart';

class AddPatients extends StatefulWidget {
  const AddPatients({Key? key}) : super(key: key);

  @override
  State<AddPatients> createState() => _AddPatientsState();
}

class _AddPatientsState extends State<AddPatients> {
  final List<Patients> newpatient = [];
  void _addPatient(String newname, String newfirstname, String newdateofbirth,
      String newemail, String newnumero) {
    final newPT = Patients(
      name: newname,
      firstname: newfirstname,
      dateofbirth: newdateofbirth,
      email: newemail,
      numero: newnumero,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      newpatient.add(newPT);
    });
  }

  void _bottomnewpatient(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewPatient(_addPatient);
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 65,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Patients',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/person add.svg',
                color: Colors.white,
                height: 29,
                width: 29,
              ),
              onPressed: () {
                _bottomnewpatient(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
