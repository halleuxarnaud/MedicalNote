import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newcalendar/component/component.dart';
import 'package:newcalendar/models/newpatients.dart';
import 'package:newcalendar/src/add_patient.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  final List<NewPatients> newpatients = [
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
    NewPatients(
      name: 'Halleux',
      firstname: 'Arnaud',
      age: 24,
      id: '9576316525',
    ),
    NewPatients(
      name: 'Perillo',
      firstname: 'Stéphanie',
      age: 25,
      id: '7460351689',
    ),
  ];

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
        Container(
          decoration: BoxDecoration(color: kSecondcolor),
          height: 600,
          width: size.width,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5, top: 8, bottom: 10),
                        child: Text(
                          newpatients[index].name +
                              ' ' +
                              newpatients[index].firstname,
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
                          'ID #' + newpatients[index].id.toString(),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: newpatients.length,
          ),
        ),
      ],
    );
  }
}
