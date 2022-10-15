import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newcalendar/models/listpatient.dart';

import '../component/component.dart';

class InformationPatient extends StatelessWidget {
  final Patients patients;

  InformationPatient(this.patients);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        patients.name + ' ' + patients.firstname,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      backgroundColor: kDefaultcolor,
    ));
  }
}
