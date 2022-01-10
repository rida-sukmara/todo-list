import 'package:todo_list/data/datasources/local/category_local_datasource.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {

  final CategoryLocalDatasource localDatasource;

  CategoryRepositoryImpl({required this.localDatasource});
  
  @override
  Future<List<Category>> all() async {
    return await localDatasource.all();
  }

  @override
  Future<Category> create({required Category category}) async {
    return localDatasource.create(category: category);
  }

}
