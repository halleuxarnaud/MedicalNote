import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/screens/patient_list.dart';
import 'package:medicalnote/screens/settings_page.dart';
import '../component/component.dart';
import '../models/listsettings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultcolor,
        toolbarHeight: 80,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: boxSettings.listenable(),
            builder: (context, Box<Settings> box, _) {
              List<Settings> settingsList = box.values.toList().cast();
              return Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 25,
                  bottom: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Padding(
                          padding: EdgeInsets.only(top: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                settingsList.isEmpty
                                    ? 'Name'
                                    : settingsList[0].name.toString() +
                                        ' ' +
                                        settingsList[0].firstname.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                settingsList.isEmpty
                                    ? 'Profesion'
                                    : settingsList[0].job.toString(),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: [
                            /*
                            IconButton(
                              onPressed: (() {
                                null;
                              }),
                              icon: SvgPicture.asset(
                                'assets/icons/search.svg',
                                height: 25,
                                width: 25,
                              ),
                              iconSize: 10,
                            ),
                            */
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingsPage()),
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/settings.svg',
                                color: Colors.white,
                                height: 28,
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      body: PatientList(),
    );
    //bottomNavigationBar: BuildBottomnav(),
  }
}
