import 'dart:io';

import 'package:medicalnote/api/pdf_api.dart';
import 'package:medicalnote/models/listpatient.dart';
import 'package:medicalnote/models/listsettings.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfPatientApi {
  static Future<File> generate(Patients patients, Settings settings) async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: (context) => [
          buildHeader(patients),
          SizedBox(height: 1 * PdfPageFormat.cm),
          buildPatientInfo(patients),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Center(
            child: Text('Notes',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
          Divider(),
          buildContent(patients),
        ],
        footer: (context) => buildFooter(settings),
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
            Text('First name: ' + patients.firstname.toString()),
            SizedBox(height: 0.5 * PdfPageFormat.mm),
            Text('Phone number: ' + patients.phonenumber.toString()),
            SizedBox(height: 0.5 * PdfPageFormat.mm),
            Text('Email: ' + patients.email.toString()),
            Text('Age: ' + patients.dateofbirth.toString()),
          ]);
  static Widget buildContent(Patients patients) => ListView(
        children: <Widget>[
          ...?patients.listOfNotes?.map(
            (e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(e.title.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 0.5 * PdfPageFormat.cm),
                Text(
                  e.note.toString(),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 0.3 * PdfPageFormat.cm),
                Column(children: <Widget>[
                  if (e.conclusion!.isNotEmpty)
                    Center(
                        child: Text('Conclusion',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(height: 0.9 * PdfPageFormat.mm),
                  Text(
                    e.conclusion.toString(),
                    textAlign: TextAlign.left,
                  ),
                ]),
                SizedBox(height: 1 * PdfPageFormat.cm),
              ],
            ),
          ),
        ],
      );
  static Widget buildFooter(Settings settings) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          Text(
            settings.firstname.toString() + ' ' + settings.name.toString(),
            style: const TextStyle(fontSize: 11),
          ),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text('Phone Number: ' + settings.phonenumber.toString(),
              style: const TextStyle(fontSize: 9)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text('Mail: ' + settings.email.toString(),
              style: const TextStyle(fontSize: 9)),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Text(
            'Institution:',
            style: const TextStyle(
                decoration: TextDecoration.underline, fontSize: 9),
          ),
        ],
      );
}
