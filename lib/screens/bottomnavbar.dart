import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newcalendar/component/component.dart';

class BuildBottomnav extends StatelessWidget {
  const BuildBottomnav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondcolor,
      height: 110,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(55),
              topRight: Radius.circular(55),
            )),
      ),
    );
  }
}
