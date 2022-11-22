import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../component/component.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    List<Settings> settingslist = [];
    late Box<Settings> boxSettings;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _Appbar(),
      body: _body(size),
    );
  }

  _Appbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Row(
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Text(
              'Settings',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10,
              width: 40,
            )
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  _body(Size size) {
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Account Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: kcolor3),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/settings.svg',
                          height: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/right-thin-chevron-svgrepo-com.svg',
                        height: 15,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 2,
            ),
            Container(
              decoration: BoxDecoration(color: kcolor3),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/settings.svg',
                          height: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        const Text(
                          'Institution',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/right-thin-chevron-svgrepo-com.svg',
                        height: 15,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 25),
              child: Text(
                'More Information',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: kcolor3),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/settings.svg',
                          height: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        const Text(
                          'FAQ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/right-thin-chevron-svgrepo-com.svg',
                        height: 15,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 2,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Developed by Halleux Arnaud',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/linkedin-svgrepo-com (1).svg',
                      height: 20,
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
