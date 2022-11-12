import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../component/component.dart';
import '../models/listpatient.dart';

class PDFConstructor extends StatelessWidget {
  final Patients patients;
  final int index;

  const PDFConstructor(this.patients, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'PDF Génerator',
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
      ),
      body: _Body(),
      bottomNavigationBar: _savepdf(),
    );
  }

  _Body() {}

  _savepdf() {
    return Container(
      child: ElevatedButton(
        onPressed: () async {},
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Save',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
