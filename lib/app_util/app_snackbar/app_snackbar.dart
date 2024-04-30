import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_snackbar.freezed.dart';

@freezed
class AppSnackbar with _$AppSnackbar {

  const factory AppSnackbar({
    @Default(null) String? errorMessage,
    @Default(null) Color?  backgroundColor,
    @Default(null) Duration? duration
  }) = _AppSnackbar;

}