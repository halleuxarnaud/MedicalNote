import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:medicalnote/component/component.dart';
import 'package:medicalnote/models/listpatient.dart';

class NewNoteController extends StatefulWidget {
  final Patients patients;
  final int index;
  const NewNoteController(this.patients, this.index, {Key? key})
      : super(key: key);

  @override
  State<NewNoteController> createState() => _NewNoteControllerState();
}

class _NewNoteControllerState extends State<NewNoteController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxPatient = Hive.box('Patient');
  }

  late Box<Patients> boxPatient;

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  TextEditingController conclusioncontroller = TextEditingController();

  void _submitData() {
    final newNOTE = Patients(
        name: widget.patients.name,
        firstname: widget.patients.firstname,
        dateofbirth: widget.patients.dateofbirth,
        email: widget.patients.email,
        phonenumber: widget.patients.phonenumber,
        date: widget.patients.date,
        id: widget.patients.id,
        listOfNotes: [
          ...?widget.patients.listOfNotes,
          ListNote(
              title: titlecontroller.text,
              note: notecontroller.text,
              conclusion: conclusioncontroller.text)
        ]);
    boxPatient.put(widget.index, newNOTE);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: _buildForm(),
      bottomNavigationBar: _saveNewNote(size),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
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
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: (() {
                    _submitData();
                  })),
            )
          ],
        ),
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
          onSubmitted: (_) => _submitData(),
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
          onSubmitted: (_) => _submitData(),
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
          onSubmitted: (_) => _submitData(),
        ),
      ],
    );
  }

  Widget _saveNewNote(Size size) {
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
              _submitData();
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Save Note',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          )),
    ]);
  }
}
