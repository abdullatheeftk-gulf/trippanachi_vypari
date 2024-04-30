import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trippanachi_vypari/app_util/app_snackbar/app_snackbar.dart';
import 'package:trippanachi_vypari/app_util/show_dialog/show_dialog.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_cubit.dart';

part 'home_listener_state.freezed.dart';

@freezed
class HomeListenerState  extends HomeState with _$HomeListenerState {

  const factory HomeListenerState({
    @Default(null) AppSnackbar? appSnackbar,
    @Default(null) String? navigate,
    @Default(null) ShowDialog? showDialog,
  }) = _HomeListenerState;

}