import 'package:equatable/equatable.dart';
import 'package:todo_list/data/models/category.dart';

class Task extends Equatable {
  final String name;
  final DateTime? dateTime;
  final Category category;

  const Task(
      {required this.name, required this.category, this.dateTime });

  @override
  List<Object?> get props => [name, dateTime, category];
}
