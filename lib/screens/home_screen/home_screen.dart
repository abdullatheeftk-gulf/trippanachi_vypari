import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trippanachi_vypari/models/member/member.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/build_state/home_build_state.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_cubit.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_listener_state/home_listener_state.dart';
import 'package:trippanachi_vypari/screens/home_screen/widgets/add_area.dart';
import 'package:trippanachi_vypari/screens/home_screen/widgets/list_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showProgressBar = false;
  bool _showAllMembers = false;
  String? _errorMessage;

  List<Member> _memberList = [];

  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    _homeCubit.getAllMembers();
    super.initState();
  }

  void _showDeleteDialog(Member member) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: Icon(
                Icons.warning,
                color: Theme.of(context).colorScheme.error,
              ),
              title: const Text("Delete"),
              content: Text(
                  "Do you want to delete ${member.name} from the memeber list!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                  child: const Text("No"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _homeCubit.deleteMember(member);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeListenerState) {
          if (state.appSnackbar != null) {
            final appSnackbar = state.appSnackbar;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(appSnackbar!.errorMessage!),
                backgroundColor: appSnackbar.backgroundColor,
                duration: const Duration(seconds: 5),
              ),
            );
          }
          if (state.showDialog != null) {
            final member = state.showDialog?.t! as Member;
            _showDeleteDialog(member);
          }
        }
      },
      listenWhen: (prev, cur) {
        if (cur is HomeListenerState) {
          return true;
        }
        return false;
      },
      buildWhen: (prv, cur) {
        if (cur is HomeBuildState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is HomeBuildState) {
          _showProgressBar = state.showProgressBar;
          _errorMessage = state.errorMessage;
          _showAllMembers = state.showAllMembers;

          if (state.result != null) {
            _memberList = state.result;
          }
        }

        return LayoutBuilder(builder: (context, constraints) {
          final maxWidth = constraints.widthConstraints().maxWidth;
          final maxHeight = constraints.heightConstraints().maxHeight;
          //printDebug(maxWidth);

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 200, 200, 200),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: maxWidth,
                    height: 150,
                    color: const Color.fromARGB(255, 110, 136, 184),
                    child:  Center(
                      child: Text(
                        "'പരസ്പര സഹായ നിധി'",
                        style: GoogleFonts.chilanka(textStyle:const TextStyle(fontSize: 42,color: Colors.white)),
                        ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: maxWidth / 2,
                        child: AddArea(
                          homeCubit: _homeCubit,
                          showProgressBar: _showProgressBar,
                        ),
                      ),
                      SizedBox(
                        width: maxWidth / 2,
                        height: maxHeight - 150,
                        child: ListArea(
                          memberList: _memberList,
                          homeCubit: _homeCubit,
                          showAllMembers: _showAllMembers,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
