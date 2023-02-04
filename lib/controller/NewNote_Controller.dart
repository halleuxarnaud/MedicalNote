import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:medicalnote/component/component.dart';
import 'package:medicalnote/models/listpatient.dart';

class NewNoteController extends StatefulWidget {
  final int index;
  const NewNoteController(this.index, {Key? key}) : super(key: key);

  @override
  State<NewNoteController> createState() => _NewNoteControllerState();
}

class _NewNoteControllerState extends State<NewNoteController> {
  @override
  void initState() {
    super.initState();
    boxPatient = Hive.box('Patient');
  }

  late Box<Patients> boxPatient;

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  TextEditingController conclusioncontroller = TextEditingController();

  void _submitData(Patients patients) {
    if (titlecontroller.text.isEmpty || notecontroller.text.isEmpty) return;
    final newNOTE = Patients(
        name: patients.name,
        firstname: patients.firstname,
        dateofbirth: patients.dateofbirth,
        email: patients.email,
        phonenumber: patients.phonenumber,
        date: patients.date,
        id: patients.id,
        listOfNotes: [
          ...?patients.listOfNotes,
          ListNote(
              title: titlecontroller.text,
              note: notecontroller.text,
              conclusion: conclusioncontroller.text)
        ]);
    boxPatient.put(widget.index, newNOTE);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(widget.index),
      body: _buildForm(),
      bottomNavigationBar: _saveNewNote(size, widget.index),
    );
  }

  AppBar _appBar(int index) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: boxPatient.listenable(),
            builder: (context, Box<Patients> box, _) {
              List<Patients> patientList = box.values.toList().cast();
              Patients patients = patientList[index];
              return Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                       Text(
                        'New Note',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -12,
                    right: 6,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kDefaultcolor, elevation: 0),
                        child: const Text(
                          'Done',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: (() {
                          _submitData(patients);
                          Navigator.pop(context);
                        })),
                  )
                ],
              );
            }),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  Column _buildForm() {
    return Column(
      children: <Widget>[
        Text(
          'Title',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold),
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Title',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(width: 1, color: kDefaultcolor),
            ),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
            filled: true,
            fillColor: kcolor3,
          ),
          controller: titlecontroller,
          onSubmitted: (_) => null,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Note',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold),
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          minLines: 2,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: 'Note',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(width: 1, color: kDefaultcolor),
            ),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
            filled: true,
            fillColor: kcolor3,
          ),
          controller: notecontroller,
          onSubmitted: (_) => null,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Conclusion',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold),
        ),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Conclusion',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(width: 1, color: kDefaultcolor),
            ),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
            filled: true,
            fillColor: kcolor3,
          ),
          controller: conclusioncontroller,
          onSubmitted: (_) => null,
        ),
      ],
    );
  }

  Widget _saveNewNote(Size size, int index) {
    return ValueListenableBuilder(
        valueListenable: boxPatient.listenable(),
        builder: (context, Box<Patients> box, _) {
          List<Patients> patientList = box.values.toList().cast();
          Patients patients = patientList[index];
          return Stack(children: <Widget>[
            Container(
              width: size.width,
              height: 80,
              color: kcolor3,
            ),
            SizedBox(
                height: 58,
                width: size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kcolor2),
                  onPressed: () {
                    _submitData(patients);
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Save Note',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                )),
          ]);
        });
  }
}
