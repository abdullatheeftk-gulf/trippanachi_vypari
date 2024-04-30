

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:trippanachi_vypari/app_util/log/log_functions.dart';
import 'package:trippanachi_vypari/main.dart';
import 'package:trippanachi_vypari/models/member/member.dart';

class DatabaseRepository{

  Future<dynamic> insertMemberData(Member member) async{
    final value = {
      "serialNo":member.serialNo,
      "name":member.name,
      "address":member.address,
      "phoneNumber":member.phoneNumber,
      "nominiName":member.nominiName
    };
    try{
       final id =  await database.insert("Member", value);
       return id;
    }on DatabaseException catch(e){
      printError("Database Error: $e");
      return "Database error";
    }catch(e){
      printError(e);
      return "Other Error on inserting";
    }
  }


  Future<dynamic> getAllMembers() async{
    try{

      final jsonList = await database.query("Member");
     // printDebug("Member List: $jsonList");
      final memberList =  jsonList.map((json) => Member.fromJson(json)).toList();
      return memberList;

    }on DatabaseException catch(e){
      printError("Database Error: $e");
      return "Database error";
    }catch(e){
      printError(e);
      return "Other Error on inserting";
    }
  }

  Future<dynamic> searchMember(String searchKey) async{
    try{

      final jsonList = await database.rawQuery("SELECT * FROM Member WHERE name LIKE ? or serialNo LIKE ?",["%$searchKey%","%$searchKey%"]);
      final memberList =  jsonList.map((json) => Member.fromJson(json)).toList();
      return memberList;
    }on DatabaseException catch(e){
      printError("Database Error: $e");
      return "Database error";
    }catch(e){
      printError(e);
      return "Other Error on inserting";
    }
  }

  Future<dynamic> editMember(Member member) async{
    try{
      final id =   await database.insert("Member", member.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
      return id;
        
    }on DatabaseException catch(e){
      printError("Database Error: $e");
      return "Database error";
    }catch(e){
      printError(e);
      return "Other Error on inserting";
    }
  }

  Future<dynamic> deleteMember(Member member) async{
    try{
       final id =  await database.delete("Member",where: "id=?",whereArgs: [member.id]);
       return id;
    }on DatabaseException catch(e){
      printError("Database Error: $e");
      return "Database error";
    }catch(e){
      printError(e);
      return "Other Error on inserting";
    }
  }
}