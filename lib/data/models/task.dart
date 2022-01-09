import 'package:equatable/equatable.dart';
import 'package:todo_list/data/models/category.dart';

class Task extends Equatable {
  final String name;
  final bool isToday;
  final Category category;

  const Task(
      {required this.name, required this.category, this.isToday = false});

  @override
  List<Object?> get props => [name, isToday, category];
}
