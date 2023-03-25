import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sp_quotation/Vehicles/Urbania/pdf/util.dart';

class pdfPage2 extends StatefulWidget {
  const pdfPage2({Key? key}) : super(key: key);

  @override
  State<pdfPage2> createState() => _pdfPage2State();
}

class _pdfPage2State extends State<pdfPage2> {

  PrintingInfo? printingInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  Future<void>_init() async{
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug=true;
    if(!kIsWeb)
      PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile,);
    return Scaffold(
      body: PdfPreview(
        maxPageWidth: 700,
        actions: [],
        onPrinted: showPrintedToast,
        onShared: showSharedToast,
        build: generatePdf,
      ),
    );
  }
}
