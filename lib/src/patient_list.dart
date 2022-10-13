import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../component/component.dart';
import '../models/newpatients.dart';
import '../screens/information_patient.dart';

class PatientList extends StatelessWidget {
  const PatientList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: kSecondcolor),
      height: 600,
      width: size.width,
      child: ListView.builder(
        itemBuilder: (context, index) {
          Patients patients = patientList[index];
          return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationPatient(patients)));
                }),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5, top: 8, bottom: 10),
                        child: Text(
                          patientList[index].name +
                              ' ' +
                              patientList[index].firstname,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 3,
                          left: 5,
                        ),
                        child: Text(
                          'ID #' + patientList[index].id.toString(),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
        itemCount: patientList.length,
      ),
    );
  }
}
