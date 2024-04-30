import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:trippanachi_vypari/app_util/log/log_functions.dart';
import 'package:trippanachi_vypari/main.dart';


class DatabaseInit{

  static Future<Database>  initLocalDatabase() async{

    final io.Directory appDirectory = await getApplicationSupportDirectory();

    String dbPath = p.join(appDirectory.path, 'databases', 'mysqlite.db');

   // printDebug(dbPath);

    

    return await databaseFactoryFfi.openDatabase(dbPath);

  }

  // create member table
  static Future<void> createMemberTable() async{
      try{
        await database.execute('''CREATE TABLE IF NOT EXISTS Member (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              serialNo TEXT NOT NULL UNIQUE,
              name TEXT NOT NULL UNIQUE,
              address TEXT,
              phoneNumber TEXT,
              nominiName TEXT,
              dateTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
              )
          '''
          );

      } on DatabaseException catch(e){
        printDebug(e);
      }
    
      catch(e){
       
        printError(e);
      }
  }

}