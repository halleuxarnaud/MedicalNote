import 'package:flutter/material.dart';

class NewPatient extends StatefulWidget {
  final Function addPT;

  const NewPatient(this.addPT, {Key? key}) : super(key: key);

  @override
  State<NewPatient> createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final namecontroller = TextEditingController();

  final firstnamecontroller = TextEditingController();

  final dateofbirthcontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final phonenumbercontroller = TextEditingController();

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
    widget.addPT(
      enteredname,
      enteredfirstname,
      entereddateofbirth,
      enteredemail,
      enteredphonenumber,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                decoration: InputDecoration(labelText: 'date of birth'),
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
                decoration: InputDecoration(labelText: 'phone number'),
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
    );
  }
}
