import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  late Box<Patients> boxPatient;

  @override
  void initState() {
    super.initState();
    boxPatient = Hive.box('Patient');
  }

  void _addNote(String newtitle, String newnote, String newconclusion) {
    final newNOTE = Patients(
      listOfNotes: [
        ListNote(title: newtitle, note: newnote, conclusion: newconclusion)
      ],
    );
    boxPatient.put(widget.index, newNOTE);
    Navigator.of(context).pop();
  }

  void _bottomnewnote(BuildContext ctx) {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController notecontroller = TextEditingController();
    TextEditingController conclusioncontroller = TextEditingController();

    void _submitData() {
      _addNote(
        titlecontroller.text,
        notecontroller.text,
        conclusioncontroller.text,
      );
    }

    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: Card(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(labelText: 'Title'),
                          controller: titlecontroller,
                          autofocus: true,
                          onSubmitted: (_) => _submitData(),
                        ),
                        TextField(
                          decoration: const InputDecoration(labelText: 'Note'),
                          controller: notecontroller,
                          autofocus: true,
                          onSubmitted: (_) => _submitData(),
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'Conclusion'),
                          controller: conclusioncontroller,
                          autofocus: true,
                          keyboardType: TextInputType.datetime,
                          onSubmitted: (_) => _submitData(),
                        ),
                        ElevatedButton(
                            onPressed: _submitData,
                            child: const Center(
                              child: Text('Submit'),
                            ))
                      ],
                    )),
              ),
              behavior: HitTestBehavior.opaque);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: _body(),
      bottomNavigationBar: _savepdf(),
    );
  }

  _Appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Row(
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
                  widget.index.toString() +
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
                  _bottomnewnote(context);
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(children: [
            ...?widget.patients.listOfNotes
                ?.map((e) => Card(child: Text(e.title.toString()))),
            const Card(
              child: Text('data'),
            )
          ]),
        ),
      ],
    );
  }

  _savepdf() {
    return Container(
      child: ElevatedButton(
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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
