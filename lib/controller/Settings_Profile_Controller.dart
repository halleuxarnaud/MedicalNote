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
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  void _submitData() {
    print('First modification');
    String enteredname = namecontroller.text;
    String enteredfirstname = firstnamecontroller.text;
    String enteredjob = jobcontroller.text;
    String enteredphonenumber = phonenumbercontroller.text;
    String enteredemail = emailcontroller.text;

    final firstSettings = Settings(
      name: enteredname,
      firstname: enteredfirstname,
      job: enteredjob,
      phonenumber: enteredphonenumber,
      email: enteredemail,
    );

    boxSettings.add(firstSettings);
    Navigator.pop(context);
  }

  void _submitData2(Settings settings) {
    print('Seconde modification');
    String enteredname2 = namecontroller.text;
    String enteredfirstname2 = firstnamecontroller.text;
    String enteredjob2 = jobcontroller.text;
    String enteredphonenumber2 = phonenumbercontroller.text;
    String enteredemail2 = emailcontroller.text;

    if (enteredname2.isEmpty) {
      enteredname2 = settings.name.toString();
    }
    if (enteredfirstname2.isEmpty) {
      enteredfirstname2 = settings.firstname.toString();
    }
    if (enteredjob2.isEmpty) {
      enteredjob2 = settings.job.toString();
    }
    if (enteredphonenumber2.isEmpty) {
      enteredphonenumber2 = settings.phonenumber.toString();
    }
    if (enteredemail2.isEmpty) {
      enteredemail2 = settings.email.toString();
    }

    final allSettings = Settings(
      name: enteredname2,
      firstname: enteredfirstname2,
      job: enteredjob2,
      phonenumber: enteredphonenumber2,
      email: enteredemail2,
    );
    print('Push second settings');
    boxSettings.putAt(0, allSettings);
  }

  @override
  Widget build(BuildContext context) {
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
            onSubmitted: (_) => null,
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
            onSubmitted: (_) => null,
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
            onSubmitted: (_) => null,
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
            onSubmitted: (_) => null,
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
            onSubmitted: (_) => null,
          ),
        ],
      );
    }

    ValueListenableBuilder<Box<Settings>> _buildForm() {
      return ValueListenableBuilder(
          valueListenable: boxSettings.listenable(),
          builder: (context, Box<Settings> box, _) {
            List<Settings> settingsList = box.values.toList().cast();
            Settings settings = settingsList[0];
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
                    labelText: settings.name!.isEmpty
                        ? 'Name'
                        : settings.name.toString(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(width: 1, color: kDefaultcolor),
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: kcolor3,
                  ),
                  controller: namecontroller,
                  onSubmitted: (_) => null,
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
                    labelText: settings.firstname!.isEmpty
                        ? 'Firstname'
                        : settings.firstname.toString(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(width: 1, color: kDefaultcolor),
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: kcolor3,
                  ),
                  controller: firstnamecontroller,
                  onSubmitted: (_) => null,
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
                    labelText:
                        settings.job!.isEmpty ? 'Job' : settings.job.toString(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(width: 1, color: kDefaultcolor),
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: kcolor3,
                  ),
                  controller: jobcontroller,
                  onSubmitted: (_) => null,
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
                      labelText: settings.phonenumber!.isEmpty
                          ? 'Phone number'
                          : settings.phonenumber.toString(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(width: 1, color: kDefaultcolor),
                      ),
                      border: InputBorder.none,
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      filled: true,
                      fillColor: kcolor3,
                    ),
                    controller: phonenumbercontroller,
                    onSubmitted: (_) => null),
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
                    labelText: settings.email!.isEmpty
                        ? 'Email'
                        : settings.email.toString(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(width: 1, color: kDefaultcolor),
                    ),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    filled: true,
                    fillColor: kcolor3,
                  ),
                  controller: emailcontroller,
                  onSubmitted: (_) => null,
                ),
              ],
            );
          });
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: boxSettings.isEmpty ? _buildFormBoxEmpty() : _buildForm()),
        ),
        bottomNavigationBar: _saveSettings(size));
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: boxSettings.listenable(),
            builder: (context, Box<Settings> box, _) {
              List<Settings> settingsList = box.values.toList().cast();
              return Row(
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
                  SizedBox(
                    width: 0,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kDefaultcolor, elevation: 0),
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: (() {
                        boxSettings.isEmpty
                            ? _submitData()
                            : _submitData2(settingsList[0]);
                        Navigator.pop(context);
                      }))
                ],
              );
            }),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  Widget _saveSettings(Size size) {
    return ValueListenableBuilder(
      valueListenable: boxSettings.listenable(),
      builder: (context, Box<Settings> box, _) {
        List<Settings> settingsList = box.values.toList().cast();
        return Stack(
          children: <Widget>[
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
                  boxSettings.isEmpty
                      ? _submitData()
                      : _submitData2(settingsList[0]);
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Save Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
