import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:trippanachi_vypari/app_util/local_database/database_init.dart';
import 'package:trippanachi_vypari/repository/database_repository/database_repository.dart';
import 'package:trippanachi_vypari/repository/print_repository/print_repository.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_cubit.dart';
import 'package:trippanachi_vypari/screens/home_screen/home_screen.dart';
import 'package:trippanachi_vypari/screens/print_priview/cubit/print_preview_cubit.dart';

// Declaring db
late final Database database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();

  //create the database
  database = await DatabaseInit.initLocalDatabase();

  await DatabaseInit.createMemberTable();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (context) => PrintRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(
                databaseRepository: context.read<DatabaseRepository>()),
          ),
          BlocProvider(
            create: (context) => PrintPreviewCubit(
              databaseRepository: context.read<DatabaseRepository>(),
              printRepository: context.read<PrintRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
