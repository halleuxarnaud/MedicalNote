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

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);
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
                child: AddPatients(),
              ),
            ),
          ],
        ),
        PatientList(),
      ],
    );
  }
}
