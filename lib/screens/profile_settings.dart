import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/models/listsettings.dart';
import 'dart:math' as math;

import '../component/component.dart';

class SettingsProfilePage extends StatefulWidget {
  const SettingsProfilePage({Key? key}) : super(key: key);

  @override
  State<SettingsProfilePage> createState() => _SettingsProfilePageState();
}

class _SettingsProfilePageState extends State<SettingsProfilePage> {
  late Box<Settings> boxSettings;

  @override
  void initState() {
    super.initState();
    boxSettings = Hive.box('Settings');
    //boxPatient.clear();
    //print('Patient ${boxPatient.values}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _Appbar(), body: _buildbody());
  }

  _Appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDefaultcolor, elevation: 0),
              child: Row(
                children: [
                  Transform.rotate(
                    angle: -math.pi / 1,
                    child: SvgPicture.asset(
                      'assets/icons/right-thin-chevron-svgrepo-com.svg',
                      color: Colors.white,
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              'Profile',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kDefaultcolor, elevation: 0),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: null),
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  _buildbody() {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController firstnamecontroller = TextEditingController();
    TextEditingController jobcontroller = TextEditingController();
    TextEditingController phonenumbercontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();

    void _submitData() {
      final enteredname = namecontroller.text;
      final enteredfirstname = firstnamecontroller.text;
      final enteredjob = jobcontroller.text;
      final enteredphonenumber = phonenumbercontroller.text;
      final enteredemail = emailcontroller.text;

      final newPT = Settings(
        name: enteredname,
        firstname: enteredfirstname,
        job: enteredjob,
        phonenumber: enteredphonenumber,
        email: enteredemail,
      );
      boxSettings.putAt(1, newPT);

      //Navigator.pop(context);
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: <Widget>[
            /*
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: widget.settings.name.toString().isEmpty
                    ? 'Name'
                    : widget.settings.name,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: namecontroller,
              onSubmitted: (_) => _submitData(),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: widget.settings.firstname.toString().isEmpty
                    ? 'Firstname'
                    : widget.settings.firstname,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: firstnamecontroller,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: widget.settings.job.toString().isEmpty
                    ? 'Job'
                    : widget.settings.job,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: jobcontroller,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: widget.settings.phonenumber.toString().isEmpty
                    ? 'Phone number'
                    : widget.settings.phonenumber,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: phonenumbercontroller,
              onSubmitted: (_) => _submitData(),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: widget.settings.email.toString().isEmpty
                    ? 'Email'
                    : widget.settings.email,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: emailcontroller,
              onSubmitted: (_) => _submitData(),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Submit'),
            ),
            */
          ],
        ),
      ),
    );
  }
}
