import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../component/component.dart';
import '../models/listpatient.dart';
import 'information_patient.dart';
import '../controller/new_patient.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

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
      id: DateTime.now().toString(),
      listOfNotes: [],
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: 65,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color(0XFF0F272F),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
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
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: kSecondcolor),
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Patients patients = patientList[index];
                return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InformationPatient(patients)));
                      }),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 8, bottom: 10),
                              child: Text(
                                patientList[index].name +
                                    ' ' +
                                    patientList[index].firstname,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 3,
                                left: 5,
                              ),
                              child: Text(
                                'ID #' + patientList[index].id.toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
              itemCount: patientList.length,
            ),
          ),
        )
      ],
    );
  }
}
