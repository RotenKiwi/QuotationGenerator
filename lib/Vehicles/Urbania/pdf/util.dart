import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import '../Urbania.dart';
import 'userDetails.dart' as user;
import 'model_info.dart' as model;
import 'employee.dart' as emp;

Future<Uint8List> generatePdf(final PdfPageFormat format) async {
  DateTime now = DateTime.now();
  final doc = pw.Document(title: 'Quoatation');
  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
  );
  final signImage = pw.MemoryImage(
    (await rootBundle.load('assets/sign.png')).buffer.asUint8List(),
  );
  final pageTheme = await _myPageTheme(format);
  final PdfColor black = PdfColor(0, 0, 0);

  doc.addPage(pw.MultiPage(
    pageTheme: pageTheme,
    build: (final context) => [
      pw.Column(
        children: [
          pw.Text(
            'Proforma Invoice',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: 30,
              decoration: pw.TextDecoration.none,
              //color: black,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Container(
              padding: pw.EdgeInsets.all(10.0),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: black,
                  width: 1,
                ),
              ),
              //Name and Details
              child: pw.Column(children: [
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
                              pw.Text(
                                'C/O.Richirich Compound,Nr.Vatika Hotel,Ghodbunder Road,Versova,Mira Road,Thane 401107',
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  decoration: pw.TextDecoration.none,
                                  //color: black,
                                  fontWeight: pw.FontWeight.normal,
                                ),
                                textAlign: pw.TextAlign.center,
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
                        ),
                      ],
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
                            'Quotation : SP/Urbania/${emp.name!.substring(0, 3)}/${now.day}${now.month}/${now.hour}${now.minute}',
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
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            'Location : ${user.location}',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.normal,
                              fontSize: 10,
                              decoration: pw.TextDecoration.none,
                              //    color: Colors.black
                            ),
                          ),
                        ),
                        pw.Text(
                          'Bank HP : ${user.bankHP}',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 10,
                            decoration: pw.TextDecoration.none,
                            //    color: Colors.black
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            'Contact : ${user.contactNo}',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.normal,
                              fontSize: 10,
                              decoration: pw.TextDecoration.none,
                              //    color: Colors.black
                            ),
                          ),
                        ),
                        pw.Text(
                          'Vehicle Color : ${model.color}',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 10,
                            decoration: pw.TextDecoration.none,
                            //    color: Colors.black
                          ),
                        ),
                      ],
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
                            '',
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
                            'Ex Showroom',
                            style: pw.TextStyle(
                              fontSize: 10,
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
                            '${model.price}',
                            style: pw.TextStyle(
                              fontSize: 10,
                              decoration: pw.TextDecoration.none,
                              color: black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    pw.SizedBox(height: 5),
                    pw.Container(
                        width: double.infinity, height: 1, color: black),
                    pw.SizedBox(height: 5),

                    // pw.Row(
                    //   children: [
                    //     pw.Expanded(
                    //       flex: 3,
                    //       child: pw.Text(
                    //         'Insurance and Registration',
                    //         style: pw.TextStyle(
                    //           fontSize: 10,
                    //           decoration: pw.TextDecoration.none,
                    //           color: black,
                    //           fontWeight: pw.FontWeight.normal,
                    //         ),
                    //       ),
                    //     ),
                    //     pw.Expanded(
                    //       flex: 1,
                    //       child: pw.SizedBox(),
                    //     ),
                    //     pw.Expanded(
                    //       flex: 1,
                    //       child: pw.SizedBox(),
                    //     ),
                    //   ],
                    // ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.insuranceType == 'Dealer')
                        ? pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  (model.insuranceType == 'Customer')
                                      ? 'Insurance: (1st Comprehensive and 3yrs Third Party)'
                                      : 'Insurance: (1st year Comprehensive)',
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
                          )
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            'CRTEMP / Disclaimer',
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
                    // (model.registrationType == 'Commercial')?pw.Row(
                    //   children: [
                    //     pw.Expanded(
                    //       flex: 3,
                    //       child: pw.Text(
                    //         'SpeedLock',
                    //         style: pw.TextStyle(
                    //           fontSize: 10,
                    //           decoration: pw.TextDecoration.none,
                    //           color: black,
                    //           fontWeight: pw.FontWeight.normal,
                    //         ),
                    //       ),
                    //     ),
                    //     pw.Expanded(
                    //       flex: 1,
                    //       child: pw.SizedBox(),
                    //     ),
                    //     pw.Expanded(
                    //       flex: 1,
                    //       child: pw.Text(
                    //         '${model.speedLock}',
                    //         style: pw.TextStyle(
                    //           fontSize: 10,
                    //           decoration: pw.TextDecoration.none,
                    //           color: black,
                    //           fontWeight: pw.FontWeight.normal,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ):pw.Container(),
                    // pw.SizedBox(
                    //   height: 5,
                    // ),
                    (model.registrationExpense == 'Dealer')
                        ? pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 3,
                                child: pw.Text(
                                  (model.model == Urbania().model[0])
                                      ? 'RTO Expenses (MH passing White Number plate)'
                                      : (model.commercialregistrationType ==
                                              'T&T')
                                          ? 'RTO Tax (MH passing under T & T category Yellow Number plate)'
                                          : 'RTO Tax (MH passing under PPRS category Yellow Number plate)',
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
                          )
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.registrationExpense == 'Dealer')
                        ? (model.model != Urbania().model[0])
                            ? pw.Row(
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
                              )
                            : pw.Container()
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.registrationType == 'Commercial')
                        ? (model.model != Urbania().model[0])
                            ? pw.Row(
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
                              )
                            : pw.Container()
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.registrationType == 'Commercial')
                        ? (model.model != Urbania().model[0])
                            ? pw.Row(
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
                              )
                            : pw.Container()
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.registrationType == 'Commercial')
                        ? (model.model != Urbania().model[0])
                            ? pw.Row(
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
                              )
                            : pw.Container()
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.registrationType == 'Commercial')
                        ? (model.model != Urbania().model[0])
                            ? pw.Row(
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
                              )
                            : pw.Container()
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    (model.registrationExpense == 'Self')
                        ? pw.Row(
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
                          )
                        : pw.Container(),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            'Total charges (Insurance + RTO)',
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
                    pw.SizedBox(height: 5),
                    pw.Container(
                        width: double.infinity, height: 1, color: black),
                    pw.SizedBox(height: 5),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            'Additional Expenses: ' +
                                ((model.other == null) ? 'None' : model.other!),
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
                    pw.SizedBox(height: 5),
                    pw.Container(
                        width: double.infinity, height: 1, color: black),
                    pw.SizedBox(height: 5),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            'Final Cost',
                            style: pw.TextStyle(
                              fontSize: 10,
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
                        children: [
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
                        signImage,
                        height: 55,
                      ),
                    ),
                  ],
                ),

                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
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
                      '6. Booking cancellation charges is Rs.10000/- .',
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
                      '10. If vehicle delivery is delayed for any reason Company will not be liable for any compensation/penalty.',
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
              ])),
        ],
      ),
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
  final file = File('example.pdf');
  await file.writeAsBytes(bytes);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Printed Succesfully')));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document Shared Succesfully')));
}
