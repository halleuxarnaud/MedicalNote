import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalnote/screens/settings.dart';

import '../component/component.dart';
import 'patient_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultcolor,
        toolbarHeight: 80,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Padding(
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
                    const Padding(
                      padding: EdgeInsets.all(3),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/ahalleux.jpeg'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Padding(
                      padding: EdgeInsets.only(top: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'First Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            child: Text(
                              'Profesion',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                              ),
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
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()),
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
          ),
        ),
      ),
      body: PatientList(),
      //bottomNavigationBar: BuildBottomnav(),
    );
  }
}
