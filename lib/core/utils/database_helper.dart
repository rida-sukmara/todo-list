import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/data/models/task.dart';

class DatabaseHelper {
  static const _databaseName = "todo_list.db";
  static const _databaseVersion = 2;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDb();
    return _database;
  }

  _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${Category.tableName} (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE ${Task.tableName}(
            id     INTEGER PRIMARY KEY, 
            name   TEXT NOT NULL,
            dateTime        TEXT NOT NULL,
            checked INTEGER NOT NULL,
            category_id INTEGER NOT NULL,
            FOREIGN KEY(category_id) REFERENCES ${Category.tableName}(id)
          )
          ''');
  }
}
