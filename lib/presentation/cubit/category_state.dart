part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  final String name;
   
  const CategoryState(this.name);
  @override
  List<Object> get props => [name];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial(): super('');
}

class CategoryCreated extends CategoryState {
  final Category category;
  const CategoryCreated({ required this.category }): super('');
}

class CategoryNameChanged extends CategoryState {
  final String to;
  const CategoryNameChanged({required this.to}): super(to);
}

class CategoryLoading extends CategoryState {
  const CategoryLoading(): super('');
}

class CategoryListLoaded extends CategoryState {
  final List<Category> items;

  const CategoryListLoaded({required this.items }): super('');
}

class CategoryFailure extends CategoryState {

  final String message;

  const CategoryFailure({ required this.message }): super('');
}
