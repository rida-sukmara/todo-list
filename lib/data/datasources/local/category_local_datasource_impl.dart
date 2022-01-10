import 'package:sqflite/sql.dart';
import 'package:todo_list/core/utils/database_helper.dart';
import 'package:todo_list/data/datasources/local/category_local_datasource.dart';
import 'package:todo_list/data/models/category.dart';

class CategoryLocalDatasourceImpl extends CategoryLocalDatasource {
  
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Future<List<Category>> all() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps =  await db.query(Category.tableName);

    return List.generate(maps.length, (index) => 
    Category(name: maps[index]['name'])
    );
  }

  @override
  Future<Category> create({required Category category}) async {
    final db = await databaseHelper.database;
    await db.insert(Category.tableName, category.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);
    return category;
  }

}
