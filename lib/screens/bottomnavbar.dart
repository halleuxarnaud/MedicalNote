import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildBottomnav extends StatelessWidget {
  const BuildBottomnav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Center(
        child: Text(
          'Navigation Bar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
