import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository.dart';
import 'package:todo_list/domain/usecases/create_category.dart';
import 'package:todo_list/domain/usecases/get_categories.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  late final CategoryRepository _repository;

  late final CreateCategory createCategory;
  late final GetCategories getCategories;

  CategoryCubit({required CategoryRepository repository }) : super(const CategoryInitial()) {
    _repository = repository;
    createCategory = CreateCategory(repository: _repository);
    getCategories = GetCategories(repository: _repository);
    all(); 
  }

  Future<void> onChangeCategoryName({required String name}) async {
    emit(CategoryNameChanged(to: name));
  }

  Future<void> create({required Category category}) async {
    try {
      emit(const CategoryLoading());
      final result = await createCategory(category: category);
      emit(CategoryCreated(category: result));
    } catch (e) {
      print("exception:onCreate" + e.toString());
      emit(const CategoryFailure(message: "Oops something when wrong, please try again."));
    }
  }

  Future<void> all() async {
    try {
      emit(const CategoryLoading());
      print("emit:loading");
      final result = await getCategories();
      emit(CategoryListLoaded(items: result));
      print("emit:loaded" + result.toString());
    } catch (e) {
      print("emit:all:catch" + e.toString());
      emit(const CategoryFailure(message: "Oops something wrong while getting data."));
    }
  }
}
