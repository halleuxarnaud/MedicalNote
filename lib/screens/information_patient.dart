import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalnote/controller/NewNote_Controller.dart';
import 'package:medicalnote/screens/note_list.dart';
import 'package:medicalnote/screens/pdfview.dart';

import '../component/component.dart';
import '../models/listpatient.dart';

class InformationPatient extends StatefulWidget {
  final Patients patients;
  final int index;

  const InformationPatient(this.patients, this.index, {Key? key})
      : super(key: key);

  @override
  State<InformationPatient> createState() => _InformationPatientState();
}

class _InformationPatientState extends State<InformationPatient> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _Appbar(),
      body: NoteList(widget.index),
      bottomNavigationBar: _savepdf(),
    );
  }

  AppBar _Appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Text(
                  widget.patients.name.toString() +
                      ' ' +
                      widget.patients.firstname.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/note.svg',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => NewNoteController(
                                  widget.patients, widget.index))));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  _savepdf() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          color: kcolor3,
        ),
        Container(
          height: 58,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kcolor2),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PDFConstructor(widget.patients, widget.index)));
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'PDF Génerator',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
