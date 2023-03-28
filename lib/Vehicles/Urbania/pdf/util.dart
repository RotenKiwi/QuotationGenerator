import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'userDetails.dart' as user;
import 'model_info.dart' as model;

Future<Uint8List> generatePdf(final PdfPageFormat format) async {
  DateTime now = DateTime.now();
  final doc = pw.Document(title: 'Quoatation');
  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
  );
  final pageTheme = await _myPageTheme(format);
  final PdfColor black = PdfColor(0, 0, 0);

  doc.addPage(pw.MultiPage(
    pageTheme: pageTheme,
    build: (final context) => [
      pw.Column(children: [

        //Name and Details
        pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Image(
                  logoImage,
                  width: 70,
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text(
                        'S.P Automotive',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                          fontSize: 30,
                          decoration: pw.TextDecoration.none,
                          //color: black,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        'Authorised Dealers For Force Motors Ltd.',
                        style: pw.TextStyle(
                          fontSize: 17,
                          decoration: pw.TextDecoration.none,
                          //color: black,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Text(
              'C/O.Richirich Compound,Nr.Vatika Hotel,Ghodbunder Road,Versova,Mira Road,Thane 401107',
              style: pw.TextStyle(
                fontSize: 12,
                decoration: pw.TextDecoration.none,
                //color: black,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.Text(
              'spforcesale@yahoo.in',
              style: pw.TextStyle(
                fontSize: 12,
                decoration: pw.TextDecoration.none,
                //color: Colors.black,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Container(width: double.infinity, height: 1, color: black),
        pw.SizedBox(height: 5),

        //User Details
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    'Quotation : SP/Urbania/${now.day}/${now.month}/${now.hour}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      //color: Colors.black,
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 40,
                ),
                pw.Text(
                  'Date: ${now.day}/${now.month}/${now.year}',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 10,
                    decoration: pw.TextDecoration.none,
                    //color: Colors.black
                  ),
                ),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    'Name : ${user.name}',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      //    color: Colors.black
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 40,
                ),
                pw.Text(
                  'Email: ${user.email}',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal,
                    fontSize: 10,
                    decoration: pw.TextDecoration.none,
                    //    color: Colors.black
                  ),
                ),
              ],
            ),
            pw.Text(
              'Location : ${user.location}',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                fontSize: 10,
                decoration: pw.TextDecoration.none,
                //    color: Colors.black
              ),
            ),
            pw.Text(
              'Contact: ${user.contactNo}',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                fontSize: 10,
                decoration: pw.TextDecoration.none,
                //color: Colors.black
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Container(width: double.infinity, height: 1, color: black),
        pw.SizedBox(height: 5),

        //Model Details
        pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    '${model.model}',
                    style: pw.TextStyle(
                      fontSize: 15,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    'Qty',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 12,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    'Amount(Rs)',
                    style: pw.TextStyle(
                      fontSize: 12,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Ex Showroom Model',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.price}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Insurance and Registration',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            (model.insuranceType == 'Dealer')?pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Comprehensive Insurance for one year',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.insurance}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
            pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'CRTEMP',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.crtemp}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 5,
            ),
            (model.registrationType == 'Commercial')?pw.Row(
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'SpeedLock',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.speedLock}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationExpense == 'Dealer')? pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'RTO Tax (MH passing under Transport category Yellow Number plate)',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.rtoTax}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationExpense == 'Dealer')?pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'RTO Receipts',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.rtoReceipts}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationType == 'Commercial')?pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Radium Strips',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.radiumStrips}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationType == 'Commercial')?pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'GPRS Activation',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.gprsActivation}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationType == 'Commercial')?
            pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Fastag',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.fastTag}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationType == 'Commercial')? pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Facilitating Charges',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.facilitatingCharges}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            (model.registrationType == 'Private')?
            pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'HSRP(Applicable only if Registration done by Customer)',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.hsrp}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ):pw.Container(),
             pw.SizedBox(
              height: 5,
            ),
            pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Total charges',
                    style: pw.TextStyle(
                      fontSize: 12,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.totalCharges}',
                    style: pw.TextStyle(
                      fontSize: 12,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
             pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    'Other(If Applicable): ${model.other}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.otherCharges}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
             pw.SizedBox(
              height: 10,
            ),
            pw.Row(
              children: [
                 pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    '',
                    style: pw.TextStyle(
                      fontSize: 10,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.SizedBox(),
                ),
                 pw.Expanded(
                  flex: 1,
                  child: pw.Text(
                    '${model.finalAmt}',
                    style: pw.TextStyle(
                      fontSize: 15,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Container(width: double.infinity, height: 1, color: black),
        pw.SizedBox(height: 5),

        //E.&.O.E Shit
        pw.Row(
          children: [
             pw.Expanded(
              child: pw.SizedBox(),
              flex: 3,
            ),
             pw.Expanded(
              flex: 2,
              child: pw.Text(
                'E.&.O.E for S.P Automotive',
                style: pw.TextStyle(
                  fontSize: 10,
                  decoration: pw.TextDecoration.none,
                  color: black,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ),
          ],
        ),

         pw.SizedBox(
          height: 5,
        ),

        //pw.Row for sign pw.Image and some t&c
        pw.Row(
          children: [
            pw.Expanded(
              flex: 3,
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children:  [
                  pw.Text(
                    'Terms and Conditions',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    '1. Prices prevailing at the time of delivery will be applicable.',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontSize: 10,
                    ),
                  ),
                  pw.Text(
                    '2. Delivery on confirmation of availability of stock from H.O.',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontSize: 10,
                    ),
                  ),
                  pw.Text(
                    '3. We are not responsible for any cash transaction against quotation.',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontSize: 10,
                    ),
                  ),
                  pw.Text(
                    '4. Demand Draft/Cheque should be in favour of M/s. S. P. Automotive ',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.normal,
                      decoration: pw.TextDecoration.none,
                      color: black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
             pw.Expanded(
              flex: 1,
              child: pw.Image(
                logoImage,
                height: 55,
              ),
            ),
          ],
        ),

        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children:  [
            pw.Text(
              '5. RTGS Details - Account No. 37597435325 Bank: State Bank Of India ,IFSC Code:- SBIN0016719, Nancy Colony,Borivali',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
            pw.Text(
              '6. Booking cancellation charges is Rs.10000/-, Odd model booking cancellation charges is Rs. 25000/-',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
            pw.Text(
              '7. Hypothecation Charges Rs. 3000/- extra.',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
            pw.Text(
              '8. For ODD models minimum delivery period will be 60 days against full payment.',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
            pw.Text(
              '9. Odd model booking cannot be cancelled for any reason.',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
            pw.Text(
              '10. If vehicle delivery is delayed for any reason Company will not be liabile for any compensation/penalty.',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
            pw.Text(
              '11. Fabrication if any will have additional charges with local tax as applicable',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.normal,
                decoration: pw.TextDecoration.none,
                color: black,
                fontSize: 10,
              ),
            ),
          ],
        ),

         pw.SizedBox(
          height: 5,
        ),

          pw.Container(
          height: 1,
          width: double.infinity,
          color: black,
        ),
         pw.SizedBox(
          height: 5,
        ),
         pw.Text(
          '"I/we hereby certify that my/ our Registration Certificate under the Mahrashtra Value Added Tax Act, 2002 is in force on the date on which the sales of the good Specified in this Tax Invoice is made by me /us and that the transaction of sale Covered by this Tax inovoice has been effected by me/us and it shall be accounted for in the turnover of sales while filing of return and the due tax, if any payable on the sale has been paid or shall be paid"',
          style: pw.TextStyle(
            fontSize: 8,
            decoration: pw.TextDecoration.none,
            color: black,
          ),
        ),
         pw.SizedBox(
          height: 5,
        ),
  pw.Container(
          height: 1,
          width: double.infinity,
          color: black,
        ),
         pw.SizedBox(
          height: 5,
        ),
         pw.Text(
          'GST No :- 27ANVPS9324F1ZA',
           textAlign: pw.TextAlign.left,
          style: pw.TextStyle(
              fontSize: 14,
              decoration: pw.TextDecoration.none,
              color: black,
              fontWeight: pw.FontWeight.bold),
        ),
         pw.SizedBox(
          height: 5,
        ),
  pw.Container(
          height: 1,
          width: double.infinity,
          color: black,
        ),
         pw.SizedBox(
          height: 10,
        ),
         pw.Text(
          'Our MOTTO is Customer Satisfaction',
          style: pw.TextStyle(
              fontSize: 18,
              decoration: pw.TextDecoration.none,
              color: black,
              fontWeight: pw.FontWeight.normal),
        ),
      ],),
    ],
  ));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  return const pw.PageTheme(
    margin: pw.EdgeInsets.symmetric(
        horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
    textDirection: pw.TextDirection.ltr,
    orientation: pw.PageOrientation.portrait,
  );
}

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pdfPageFormat,
) async {
  final bytes = await build(pdfPageFormat);
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('save file as ${file.path}');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Printed Succesfully')));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Shared Succesfully')));
}
