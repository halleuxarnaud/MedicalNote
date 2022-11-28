import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/models/listsettings.dart';
import 'dart:math' as math;

import '../component/component.dart';

class SettingsProfilePage extends StatefulWidget {
  final Settings settingsList;
  const SettingsProfilePage(this.settingsList, {Key? key}) : super(key: key);

  @override
  State<SettingsProfilePage> createState() => _SettingsProfilePageState();
}

class _SettingsProfilePageState extends State<SettingsProfilePage> {
  late Box<Settings> boxSettings;

  @override
  void initState() {
    super.initState();
    boxSettings = Hive.box('Settings');
  }

  void test() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: _appBar(),
        body: _buildBody(),
        bottomNavigationBar: _saveSettings(size));
  }

  AppBar _appBar() {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(
                    angle: -math.pi / 1,
                    child: SvgPicture.asset(
                      'assets/icons/right-thin-chevron-svgrepo-com.svg',
                      color: Colors.white,
                      height: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              width: 110,
            ),
            /*
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kDefaultcolor, elevation: 0),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: ),
                */
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  Widget _buildBody() {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController firstnamecontroller = TextEditingController();
    TextEditingController jobcontroller = TextEditingController();
    TextEditingController phonenumbercontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();

    void _submitData() {
      String enteredname = namecontroller.text;
      String enteredfirstname = firstnamecontroller.text;
      String enteredjob = jobcontroller.text;
      String enteredphonenumber = phonenumbercontroller.text;
      String enteredemail = emailcontroller.text;
      print('object');

      final firstSettings = Settings(
        name: enteredname,
        firstname: enteredfirstname,
        job: enteredjob,
        phonenumber: enteredphonenumber,
        email: enteredemail,
      );

      void _noModificateForm() {
        if (enteredname.isEmpty) {
          enteredname = widget.settingsList.name.toString();
        }
        if (enteredfirstname.isEmpty) {
          enteredfirstname = widget.settingsList.firstname.toString();
        }
        if (enteredjob.isEmpty) {
          enteredjob = widget.settingsList.job.toString();
        }
        if (enteredphonenumber.isEmpty) {
          enteredphonenumber = widget.settingsList.phonenumber.toString();
        }
        if (enteredemail.isEmpty) {
          enteredemail = widget.settingsList.email.toString();
        }

        final allSettings = Settings(
          name: enteredname,
          firstname: enteredfirstname,
          job: enteredjob,
          phonenumber: enteredphonenumber,
          email: enteredemail,
        );

        boxSettings.putAt(0, allSettings);
      }

      if (boxSettings.isEmpty) {
        boxSettings.add(firstSettings);
      } else {
        _noModificateForm();
      }
      Navigator.pop(context);
    }

    Column _buildFormBoxEmpty() {
      return Column(
        children: <Widget>[
          Text(
            'Name',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
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
          Text(
            'Firstname',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Firstname',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: firstnamecontroller,
            onSubmitted: (_) => _submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Job',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Job',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: jobcontroller,
            onSubmitted: (_) => _submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Phone number',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Phone number',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: phonenumbercontroller,
            onSubmitted: (_) => _submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Email',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Email',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: emailcontroller,
            onSubmitted: (_) => _submitData(),
          ),
        ],
      );
    }

    Column _buildForm() {
      return Column(
        children: <Widget>[
          Text(
            'Name',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: widget.settingsList.name!.isEmpty
                  ? 'Name'
                  : widget.settingsList.name.toString(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
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
          Text(
            'Firstname',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: widget.settingsList.firstname!.isEmpty
                  ? 'Firstname'
                  : widget.settingsList.firstname.toString(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: firstnamecontroller,
            onSubmitted: (_) => _submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Job',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: widget.settingsList.job!.isEmpty
                  ? 'Job'
                  : widget.settingsList.job.toString(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: jobcontroller,
            onSubmitted: (_) => _submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Phone number',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: widget.settingsList.phonenumber!.isEmpty
                  ? 'Phone number'
                  : widget.settingsList.phonenumber.toString(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: phonenumbercontroller,
            onSubmitted: (_) => _submitData(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Email',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: widget.settingsList.email!.isEmpty
                  ? 'Email'
                  : widget.settingsList.email.toString(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: emailcontroller,
            onSubmitted: (_) => _submitData(),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: boxSettings.isEmpty ? _buildFormBoxEmpty() : _buildForm()),
    );
  }

  Widget _saveSettings(Size size) {
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
            onPressed: () async {},
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Save Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          )),
    ]);
  }
}
