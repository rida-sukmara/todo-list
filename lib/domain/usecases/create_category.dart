
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository.dart';

class CreateCategory {
  final CategoryRepository repository;

  CreateCategory({ required this.repository });

  Future<Category> call({ required Category category }) async {
    return await repository.create(category: category);
  }
}
