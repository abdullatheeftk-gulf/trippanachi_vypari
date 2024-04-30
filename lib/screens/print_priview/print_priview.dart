

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:trippanachi_vypari/screens/print_priview/cubit/print_preview_cubit.dart';


class PrintPriviewScreen extends StatelessWidget {
  const PrintPriviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final printCubit = context.read<PrintPreviewCubit>();
    

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Print Preview"),
      ),
      body: PdfPreview(build: (format)=>printCubit.generatePdf(format)),
    );
  }

   Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.notoSansMalayalamRegular();
    final ByteData imageData = await rootBundle.load("assets/images/vyapari_logo.jpeg");
    Uint8List uint8list = (imageData).buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font,fontSize: 12)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.Image(pw.MemoryImage(uint8list ))),
              pw.Text("Test Data")
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}