import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/models/listpatient.dart';

class NoteList extends StatefulWidget {
  final int index;
  const NoteList(this.index, {Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  late Box<Patients> boxPatient;

  @override
  void initState() {
    super.initState();
    boxPatient = Hive.box('Patient');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: boxPatient.listenable(),
            builder: (context, Box<Patients> box, _) {
              List<Patients> patientsList = box.values.toList().cast();
              Patients patients = patientsList[widget.index];
              return ListView(
                children: [
                  ...?patients.listOfNotes?.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 15,
                        left: 25,
                        right: 25,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.title.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                e.note.toString(),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              Column(
                                children: [
                                  e.conclusion.toString().isEmpty
                                      ? const Text('')
                                      : Column(
                                          children: [
                                            const Text(
                                              'Conclusion: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              e.conclusion.toString(),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
