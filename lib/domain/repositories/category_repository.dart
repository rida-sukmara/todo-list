import 'package:todo_list/data/models/category.dart';

abstract class CategoryRepository {
  Future<Category> create({required Category category });
}
