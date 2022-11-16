import 'dart:io';

import 'package:medicalnote/api/pdf_api.dart';
import 'package:medicalnote/models/listpatient.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfPatientApi {
  static Future<File> generate(Patients patients) async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => [
          buildHeader(patients),
          SizedBox(height: 3 * PdfPageFormat.cm),
          buildPatientInfo(patients),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Center(
            child: Text('Anamnèse Patient',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
          Divider(),
          buildContent(patients),
          Divider(),
        ],
        //footer: (context) => [buildFooter(patients)],
      ),
    );

    return PdfApi.saveDocument(
        name: patients.name.toString() +
            ' ' +
            patients.firstname.toString() +
            '.pdf',
        pdf: pdf);
  }

  static Widget buildHeader(Patients patients) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            patients.name.toString() + ' ' + patients.firstname.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Center(
              child: Text('Image MedicalNote'),
            ),
          ),
        ],
      );
  static Widget buildPatientInfo(Patients patients) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ' + patients.name.toString()),
            SizedBox(height: 0.5 * PdfPageFormat.mm),
            Text('Firstname: ' + patients.firstname.toString()),
            SizedBox(height: 0.5 * PdfPageFormat.mm),
            Text('Phone number: ' + patients.phonenumber.toString()),
            SizedBox(height: 0.5 * PdfPageFormat.mm),
            Text('Email: ' + patients.email.toString()),
            SizedBox(height: 0.5 * PdfPageFormat.mm),
            Text('Dateofbirth: ' + patients.dateofbirth.toString()),
          ]);
  static Widget buildContent(Patients patients) => ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...?patients.listOfNotes?.map((e) => Text(e.title.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold))),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              ...?patients.listOfNotes?.map((e) => Text(
                    e.note.toString(),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(height: 0.3 * PdfPageFormat.cm),
              ...?patients.listOfNotes?.map(
                (e) => Text(
                  e.conclusion.toString(),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      );
  //static Widget buildFooter(Patients patients) => Column();
}
