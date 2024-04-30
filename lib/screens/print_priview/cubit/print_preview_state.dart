part of 'print_preview_cubit.dart';


class PrintPreviewState{}

final class PrintPreviewInitialState extends PrintPreviewState{}

final class PrintPreviewGetMembersList extends PrintPreviewState{
  final List<Member> members;

  PrintPreviewGetMembersList({required this.members});
  
}
