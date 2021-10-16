// Data Provider para o banco de dados local sqflite

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trab_01/model/user.dart';

class DatabaseLocalServer {
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();

  DatabaseLocalServer._createInstance();

  static Database? _database;

  String userTable = "user_table";
  String colId = "id";
  String colName = "name";
  String colLastName = "last_name";
  String colEmail = "email";
  String colTeam = "team";
  String colBirthday = "birthday";
  String colCity = "city";
  String colState = "state";
  String colPassword = "password";

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  get stream => null;

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "trab01.db";
    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  _createDb(Database db, int newVersion) {
    db.execute("""
       CREATE TABLE $userTable (
           $colId INTEGER PRIMARY KEY AUTOINCREMENT,
           $colName TEXT,
           $colLastName TEXT,
           $colEmail TEXT,
           $colTeam TEXT,
           $colBirthday TEXT,
           $colCity TEXT,
           $colState TEXT,
           $colPassword TEXT
          );
    """);
  }

  Future<int> insertUser(User? user) async {
    Database? db = await this.database;

    if (db != null && user != null) return db.insert(userTable, user.toMap());
    return -1;
  }

  Future<int> updateUser(int userId, User user) async {
    Database? db = await this.database;
    if (db != null) {
      return db.update(userTable, user.toMap(),
          where: "$colId = ?", whereArgs: [userId]);
    }
    return -1;
  }

  Future<int> deleteUser(int userId) async {
    Database? db = await this.database;

    if (db != null) return db.rawDelete("""
        DELETE FROM $userTable WHERE $colId = $userId;
      """);
    return -1;
  }

  Future<List<User>> getUserList() async {
    Database? db = await this.database;
    if (db != null) {
      List<User> userList = [];
      List<Map<String, Object?>> userMapList =
          await db.rawQuery("SELECT * FROM $userTable;");
      for (int i = 0; i < userMapList.length; i++) {
        User user = User.fromMap(userMapList[i]);

        userList.add(user);
      }
      return userList;
    }
    return [];
  }
}
