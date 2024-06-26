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
      final pw.Document pdf =
          pw.Document(version: PdfVersion.pdf_1_5, compress: true);
      final pw.Font titleFont = await PdfGoogleFonts.balooChettan2Medium();
      List<Member> membersList = [];

      int i = 0;
      int pageNumbers = 0;

      for (final member in listOfMember) {
        i++;
        membersList.add(member);
        if (i == 10) {
          try {
            _pageDrawing(
              pageNumber: pageNumbers,
              pdf: pdf,
              members: membersList,
              titleFont: titleFont,
              pdfPageFormat: pdfPageFormat,
              title: title,
            );
            membersList = [];
            pageNumbers++;
          } catch (e) {
            printError(e);
          }
        }
      }

      if (membersList.isNotEmpty) {
        _pageDrawing(
          pageNumber: pageNumbers++,
          pdf: pdf,
          members: membersList,
          titleFont: titleFont,
          pdfPageFormat: pdfPageFormat,
          title: title,
        );
      }

      return pdf.save();
    } catch (e) {
      printError(e.toString());
      throw e.toString();
    }
  }

  void _pageDrawing({
    required int pageNumber,
    required pw.Document pdf,
    required List<Member> members,
    required pw.Font titleFont,
    required PdfPageFormat pdfPageFormat,
    required String title,
  }) {
    pdf.addPage(
      pw.Page(
        pageFormat: pdfPageFormat,
        margin: const pw.EdgeInsets.all(16),
        build: (context) {
          return pw.Column(
            children: [
              pw.Text(
                title,
                style: pw.TextStyle(
                  font: titleFont,
                  fontSize: 20,
                  color: PdfColors.green,
                  decoration: pw.TextDecoration.underline,
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Expanded(
                child: pw.ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return pw.Row(
                        children: [
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
                        ],
                      );
                    }
                    return pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.Text("${index + pageNumber * 10},    "),
                        ),
                        pw.Expanded(
                            flex: 5, child: pw.Text(members[index - 1].name),),
                        pw.Expanded(
                            flex: 5,
                            child: pw.Text(members[index - 1].address ?? "-",maxLines: 4),),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return pw.Divider(thickness: 0.2);
                  },
                  itemCount: members.length + 1,
                ),
              ),
              pw.Footer(title: pw.Text("Page ${pageNumber + 1}"))
            ],
          );
        },
      ),
    );
  }
}
