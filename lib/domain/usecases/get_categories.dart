import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories({required this.repository});

  Future<List<Category>> call() async {
    return await repository.all();
  }
}
