import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../component/component.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
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
              'FAQ',
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              width: 120,
            ),
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }
}
