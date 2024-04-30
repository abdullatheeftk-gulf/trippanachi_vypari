import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:trippanachi_vypari/app_util/log/log_functions.dart';
import 'package:trippanachi_vypari/models/member/member.dart';

class PrintRepository {
  // Generate pdf
  Future<Uint8List> generatePdf({
    required PdfPageFormat pdfPageFormat,
    required String title,
    required List<Member> listOfMember,
  }) async {
    try {
      final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
      final titleFont = await PdfGoogleFonts.balooChettan2Medium();

      pdf.addPage(pw.Page(
          pageFormat: pdfPageFormat,
          margin: const pw.EdgeInsets.all(16),
          build: (context) {
            return pw.Column(children: [
              // Title
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title,
                      style: pw.TextStyle(
                        font: titleFont,
                        decoration: pw.TextDecoration.underline,
                        color: PdfColors.blue400,
                      )),
                ),
              ),
              pw.SizedBox(height: 30),
              pw.ListView.separated(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return pw.Row(children: [
                      //pw.Text("SI    ",style:  pw.TextStyle(fontSize: 14,fontWeight: pw.FontWeight.bold)),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          "Si",
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Text(
                          "Name",
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Text(
                          "Address",
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ]);
                  }
                  return pw.Row(children: [
                   // pw.Text("$index,    "),
                   pw.Expanded(flex: 1, child: pw.Text("$index,    "),),
                    pw.Expanded(flex: 5, child: pw.Text(listOfMember[index - 1].name)),
                    pw.Expanded(flex: 5, child: pw.Text(listOfMember[index - 1].address ?? "-")),
                  ]);
                },
                separatorBuilder: (context, index) {
                  return pw.Divider(thickness: 0.2);
                },
                itemCount: listOfMember.length + 1,
              )
            ]);
          }));

      return pdf.save();
    } catch (e) {
      printError(e.toString());
      throw e.toString();
    }
  }
}
