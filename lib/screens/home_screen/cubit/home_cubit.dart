import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippanachi_vypari/app_util/app_snackbar/app_snackbar.dart';
import 'package:trippanachi_vypari/app_util/log/log_functions.dart';
import 'package:trippanachi_vypari/app_util/show_dialog/show_dialog.dart';
import 'package:trippanachi_vypari/repository/database_repository/database_repository.dart';
import 'package:trippanachi_vypari/models/member/member.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/build_state/home_build_state.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/edit_state/home_edit_state.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_listener_state/home_listener_state.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DatabaseRepository databaseRepository;
  HomeCubit({required this.databaseRepository}) : super(HomeInitialState());

  void getAllMembers() async {
    emit(const HomeBuildState(showProgressBar: true, showAllMembers: false));

    final memberList = await databaseRepository.getAllMembers();

    if (memberList is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: memberList));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: memberList,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }
    //printError(memberList);
    emit(HomeBuildState<List<Member>>(
        showProgressBar: false, result: memberList));
  }

  void insertMemberdata(Member member) async {
    emit(const HomeBuildState(showProgressBar: true, showAllMembers: false));

    final result = await databaseRepository.insertMemberData(member);

    if (result is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: result));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: result,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }

    final memberList = await databaseRepository.getAllMembers();

    if (memberList is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: memberList));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: memberList,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }

    emit(HomeBuildState(showProgressBar: false, result: memberList));
  }

  void searchMembers(String searchKey) async {
    emit(const HomeBuildState(showProgressBar: true));

    final memberList = await databaseRepository.searchMember(searchKey);

    if (memberList is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: memberList));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: memberList,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }
    //printError(memberList);
    emit(HomeBuildState<List<Member>>(
        showProgressBar: false, result: memberList, showAllMembers: true));
  }

// Set Members To Edit
  void setMembersToEdit(Member member) {
    emit(const HomeListenerState(appSnackbar: null));
    emit(HomeEditState(member: member));
  }

// Update member data
  void updateMemberData(Member member) async {
    emit(const HomeBuildState(showProgressBar: true, showAllMembers: false));

    final result = await databaseRepository.editMember(member);

    if (result is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: result));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: result,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }

    emit(const HomeEditState(member: null));

    final memberList = await databaseRepository.getAllMembers();

    if (memberList is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: memberList));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: memberList,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }

    emit(HomeBuildState(showProgressBar: false, result: memberList));
  }

  // Show delete dialog
  void showDeleteDialog(Member member) async {
    emit(const HomeBuildState(showProgressBar: false));
    emit(HomeListenerState(showDialog: ShowDialog<Member>(t: member)));
  }

// Delete a member
  void deleteMember(Member member) async {
    emit(const HomeBuildState(showProgressBar: true, showAllMembers: false));

    final result = await databaseRepository.deleteMember(member);

    if (result is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: result));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: result,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }

    final memberList = await databaseRepository.getAllMembers();

    if (memberList is String) {
      emit(HomeBuildState(showProgressBar: false, errorMessage: memberList));
      emit(
        HomeListenerState(
          appSnackbar: AppSnackbar(
            errorMessage: memberList,
            backgroundColor: Colors.red,
          ),
        ),
      );
      return;
    }

    emit(HomeBuildState(showProgressBar: false, result: memberList));
  }

  // Cancel Edit

  void cancelUpdate() {
    emit(const HomeEditState(member: null));
  }

// Sorting data
  void sortData({
    required List<Member> members,
  }) {
    final list = members.reversed.toList();
    emit(HomeBuildState(result: list));
  }
}
