
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trippanachi_vypari/models/member/member.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_cubit.dart';

part 'home_edit_state.freezed.dart';

@freezed
class HomeEditState extends HomeState with _$HomeEditState {

  const factory HomeEditState({
    @Default(null) Member? member,
  }) = _HomeEditState;

}