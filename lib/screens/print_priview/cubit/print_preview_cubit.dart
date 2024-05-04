import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:trippanachi_vypari/models/member/member.dart';
import 'package:trippanachi_vypari/repository/database_repository/database_repository.dart';
import 'package:trippanachi_vypari/repository/print_repository/print_repository.dart';

part 'print_preview_state.dart';

class PrintPreviewCubit extends Cubit<PrintPreviewState> {
  final DatabaseRepository databaseRepository;
  final PrintRepository printRepository;
  PrintPreviewCubit({
    required this.printRepository,
    required this.databaseRepository,
  }) : super(PrintPreviewInitialState());

  Future<Uint8List> generatePdf(PdfPageFormat pdfPageFormat) async {
    final members = await databaseRepository.getAllMembers() as List<Member>;

    return printRepository.generatePdf(
      pdfPageFormat: pdfPageFormat,
      title: "പരസ്പര സഹായ നിധി",
      listOfMember: members,
    );
  }
}
