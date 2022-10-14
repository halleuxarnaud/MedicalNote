import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newcalendar/component/component.dart';
import 'package:newcalendar/models/newpatients.dart';
import 'package:newcalendar/screens/information_patient.dart';
import 'package:newcalendar/src/add_patient.dart';
import 'package:newcalendar/src/patient_list.dart';
import 'package:newcalendar/src/topbody.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBody(),
        PatientList(),
      ],
    );
  }
}
