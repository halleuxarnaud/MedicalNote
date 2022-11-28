import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/models/listsettings.dart';

import '../api/pdf_api.dart';
import '../api/pdf_patient_api.dart';
import '../component/component.dart';
import '../models/listpatient.dart';
import 'dart:math' as math;

class PDFConstructor extends StatefulWidget {
  final Patients patients;
  final int index;

  const PDFConstructor(this.patients, this.index, {Key? key}) : super(key: key);

  @override
  State<PDFConstructor> createState() => _PDFConstructorState();
}

class _PDFConstructorState extends State<PDFConstructor> {
  late Box<Settings> boxSettings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxSettings = Hive.box('Settings');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _Appbar(),
      body: _Body(),
      bottomNavigationBar: _savepdf(size),
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
    );
  }

  _Body() {}

  _savepdf(Size size) {
    return ValueListenableBuilder(
      valueListenable: boxSettings.listenable(),
      builder: (context, Box<Settings> box, _) {
        List<Settings> settingsList = box.values.toList().cast();
        Settings settings = settingsList[0];
        return Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: 80,
              color: kcolor3,
            ),
            Container(
              height: 58,
              width: size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kcolor2),
                onPressed: () async {
                  final pdfFile = await PdfPatientApi.generate(widget.patients, settings);
                  PdfApi.openFile(pdfFile);
                },
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Transform.rotate(
                              angle: -math.pi / 1,
                              child: SvgPicture.asset(
                                'assets/icons/up-arrow-svgrepo-com.svg',
                                color: Colors.white,
                                height: 17,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Download PDF',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
