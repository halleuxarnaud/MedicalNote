import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/controller/NewPatient_Controller.dart';
import 'package:medicalnote/models/listsettings.dart';
import '../component/component.dart';
import '../models/listpatient.dart';
import 'information_patient.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);
  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  late Box<Patients> boxPatient;
  late Box<Settings> settings;

  @override
  void initState() {
    super.initState();
    boxPatient = Hive.box('Patient');
    settings = Hive.box('Settings');
  }

  void _deleteitem(
    var index,
    Box box,
  ) {
    setState(() {
      box
          .deleteAt(index)
          .whenComplete(() => print('MedicalNote: Patients delete'));
    });
  }

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
                color: kSecondcolor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                width: size.width,
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Patients',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/person add.svg',
                            color: Colors.white,
                            height: 29,
                            width: 29,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        NewPatientController())));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: kSecondcolor),
            width: size.width,
            child: ValueListenableBuilder(
              valueListenable: boxPatient.listenable(),
              builder: (context, Box<Patients> box, _) {
                List<Patients> patientList = box.values.toList().cast();
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: GestureDetector(
                          onTap: (() {
                            if (settings.isEmpty) {
                              print('Remplissage');
                              final allSettings = Settings(
                                name: 'Name',
                                firstname: 'Firstname',
                                job: 'job',
                                phonenumber: 'phonenumber',
                                email: 'email',
                              );
                              settings.add(allSettings);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InformationPatient(
                                          patientList[index], index)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InformationPatient(
                                          patientList[index], index)));
                            }
                          }),
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 8, bottom: 10),
                                  child: Text(
                                    patientList[index].name.toString() +
                                        ' ' +
                                        patientList[index].firstname.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 3,
                                    left: 5,
                                  ),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        'assets/icons/trash-svgrepo-com.svg'),
                                    onPressed: () {
                                      _deleteitem(index, boxPatient);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  itemCount: patientList.length,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
