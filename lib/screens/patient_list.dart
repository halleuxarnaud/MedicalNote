import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../component/component.dart';
import '../models/listpatient.dart';
import 'information_patient.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  List<Patients> patientList = [];
  late Box<Patients> boxPatient;

  @override
  void initState() {
    super.initState();
    boxPatient = Hive.box('Patient');
    print('Patient ${boxPatient.values}');
  }

  void _addPatient(String newname, String newfirstname, String newdateofbirth,
      String newemail, String newnumero) {
    final newPT = Patients(
      name: newname,
      firstname: newfirstname,
      dateofbirth: newdateofbirth,
      email: newemail,
      numero: newnumero,
      date: DateTime.now(),
      id: DateTime.now().millisecondsSinceEpoch,
      //id: DateTime.now().millisecondsSinceEpoch,
      //listOfNotes: [],
    );
    boxPatient.add(newPT);

    Navigator.of(context).pop();
  }

  void _bottomnewpatient(BuildContext ctx) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController firstnamecontroller = TextEditingController();
    TextEditingController dateofbirthcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController phonenumbercontroller = TextEditingController();

    void _submitData() {
      final enteredname = namecontroller.text;
      final enteredfirstname = firstnamecontroller.text;
      final entereddateofbirth = dateofbirthcontroller.text;
      final enteredemail = emailcontroller.text;
      final enteredphonenumber = phonenumbercontroller.text;

      if (enteredname.isEmpty ||
          enteredfirstname.isEmpty ||
          entereddateofbirth.isEmpty ||
          enteredemail.isEmpty ||
          enteredphonenumber.isEmpty) {
        print('No input');
        return;
      }
      _addPatient(
        enteredname,
        enteredfirstname,
        entereddateofbirth,
        enteredemail,
        enteredphonenumber,
      );
    }

    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: Card(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: 'name'),
                          controller: namecontroller,
                          autofocus: true,
                          onSubmitted: (_) => _submitData(),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'first name'),
                          controller: firstnamecontroller,
                          autofocus: true,
                          onSubmitted: (_) => _submitData(),
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'date of birth'),
                          controller: dateofbirthcontroller,
                          autofocus: true,
                          keyboardType: TextInputType.datetime,
                          onSubmitted: (_) => _submitData(),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'email'),
                          controller: emailcontroller,
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          onSubmitted: (_) => _submitData(),
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'phone number'),
                          controller: phonenumbercontroller,
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          onSubmitted: (_) => _submitData(),
                        ),
                        ElevatedButton(
                            onPressed: _submitData,
                            child: Center(
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
                width: size.width,
                height: 65,
                child: Padding(
                  padding: EdgeInsets.all(10),
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
                          _bottomnewpatient(context);
                        },
                      ),
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
                    Patients patients = patientList[index];
                    return Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InformationPatient(patients)));
                          }),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 8, bottom: 10),
                                  child: Text(
                                    patientList[index].name +
                                        ' ' +
                                        patientList[index].firstname,
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
                                  /*
                                child: Text(
                                  'ID #' + patientList[index].id.toString(),
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                */
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
        )
      ],
    );
  }
}
