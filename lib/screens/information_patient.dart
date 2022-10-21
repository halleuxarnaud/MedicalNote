import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:MedicalNote/models/listpatient.dart';

import '../component/component.dart';
//TODO: Ajouter la lecture de la class note au card

class InformationPatient extends StatefulWidget {
  final Patients patients;

  const InformationPatient(this.patients, {Key? key}) : super(key: key);

  @override
  State<InformationPatient> createState() => _InformationPatientState();
}

class _InformationPatientState extends State<InformationPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/note.svg',
                      color: Colors.white,
                    )),
              )
            ],
          ),
          Expanded(
            child: ListView(children: [Card(child: Text('data'))]),
          ),
        ],
      ),
      bottomNavigationBar: _savepdf(),
    );
  }

  _Appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        widget.patients.name + ' ' + widget.patients.firstname,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/note.svg',
                    color: Colors.white,
                  )),
            )
          ],
        ),
        Expanded(
          child: ListView(children: [Card(child: Text('data'))]),
        ),
      ],
    );
  }

  _savepdf() {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Save to PDF',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
