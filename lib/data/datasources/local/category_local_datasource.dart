import 'package:todo_list/data/models/category.dart';

abstract class CategoryLocalDatasource {
  Future<Category> create ({required Category category});
  Future<List<Category>> all();
}
