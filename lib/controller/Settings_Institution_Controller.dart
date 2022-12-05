import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalnote/component/component.dart';
import 'dart:math' as math;

class SettingsInstitutionController extends StatefulWidget {
  const SettingsInstitutionController({Key? key}) : super(key: key);

  @override
  State<SettingsInstitutionController> createState() =>
      _SettingsInstitutionControllerState();
}

class _SettingsInstitutionControllerState
    extends State<SettingsInstitutionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _Appbar());
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
              'Institution',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDefaultcolor, elevation: 0),
              child: Text(
                'Done',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }
}
