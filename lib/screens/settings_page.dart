import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/screens/faq_page.dart';
import 'package:medicalnote/controller/Settings_Profile_Controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../component/component.dart';
import '../models/listsettings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  late Box<Settings> boxSettings;

  @override
  void initState() {
    super.initState();
    boxSettings = Hive.box('Settings');
  }

  _LaunchUrl() async {
    const url = 'https://www.linkedin.com/in/arnaud-halleux-64a061258';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
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
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Account Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ValueListenableBuilder(
                valueListenable: boxSettings.listenable(),
                builder: (context, Box<Settings> box, _) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kcolor3),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsProfilePage()));
                    },
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
                              const SizedBox(
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
                          SvgPicture.asset(
                            'assets/icons/right-thin-chevron-svgrepo-com.svg',
                            color: Colors.white,
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 25),
              child: Text(
                'More Information',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolor3),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const FAQPage())));
                },
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
                          const SizedBox(
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
                      SvgPicture.asset(
                        'assets/icons/right-thin-chevron-svgrepo-com.svg',
                        color: Colors.white,
                        height: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              height: 2,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _LaunchUrl,
                    child: const Text(
                      'Developed by Halleux Arnaud',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _LaunchUrl();
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/linkedin-svgrepo-com (1).svg',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
