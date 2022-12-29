import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/api/pdf_api.dart';
import 'package:medicalnote/api/pdf_patient_api.dart';
import 'package:medicalnote/controller/NewNote_Controller.dart';
import 'package:medicalnote/screens/note_list.dart';
import 'dart:math' as math;

import '../component/component.dart';
import '../models/listpatient.dart';
import '../models/listsettings.dart';

class InformationPatient extends StatefulWidget {
  final Patients patients;
  final int index;

  const InformationPatient(this.patients, this.index, {Key? key})
      : super(key: key);

  @override
  State<InformationPatient> createState() => _InformationPatientState();
}

class _InformationPatientState extends State<InformationPatient> {
  late Box<Settings> boxSettings;
  late Box<Patients> boxPatient;

  Future showBottomInstitution() {
    return showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: ((context) {
          return Container(
              height: 110,
              child: SingleChildScrollView(
                  child: Column(
                children: [Text('data')],
              )));
        }));
  }

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxSettings = Hive.box('Settings');
    boxPatient = Hive.box('Patient');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _Appbar(),
      body: NoteList(widget.index),
      bottomNavigationBar: _savepdf(size, widget.index),
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
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    NewNoteController(widget.index))));
                      });
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

  _savepdf(Size size, int index) {
    return ValueListenableBuilder(
      valueListenable: boxSettings.listenable(),
      builder: (context, Box<Settings> box, _) {
        List<Settings> settingsList = box.values.toList().cast();
        Settings settings = settingsList[0];
        return ValueListenableBuilder(
          valueListenable: boxPatient.listenable(),
          builder: (context, Box<Patients> box, _) {
            List<Patients> patientList = box.values.toList().cast();
            Patients patients = patientList[index];
            return Stack(
              children: <Widget>[
                Container(
                  width: size.width,
                  height: 80,
                  color: kcolor3,
                ),
                Container(
                  height: 58,
                  width: size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kcolor2),
                    onPressed: () async {
                      await showBottomInstitution();
                      // final pdfFile =
                      //  await PdfPatientApi.generate(patients, settings);
                      //PdfApi.openFile(pdfFile);
                    },
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Transform.rotate(
                                  angle: -math.pi / 1,
                                  child: SvgPicture.asset(
                                    'assets/icons/up-arrow-svgrepo-com.svg',
                                    color: Colors.white,
                                    height: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Download PDF',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
