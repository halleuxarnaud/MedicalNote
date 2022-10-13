import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class NewPatient extends StatelessWidget {
  final Function addPT;
  final namecontroller = TextEditingController();
  final firstnamecontroller = TextEditingController();
  final dateofbirthcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();

  NewPatient(this.addPT);

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
    addPT(
      enteredname,
      enteredfirstname,
      entereddateofbirth,
      enteredemail,
      enteredphonenumber,
    );
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
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'first name'),
                controller: firstnamecontroller,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'date of birth'),
                controller: dateofbirthcontroller,
                //keyboardType: TextInputType.datetime,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'email'),
                controller: emailcontroller,
                // keyboardType: TextInputType.emailAddress,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'phone number'),
                controller: phonenumbercontroller,
                //keyboardType: TextInputType.phone,
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
