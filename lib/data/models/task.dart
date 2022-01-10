import 'package:equatable/equatable.dart';
import 'package:todo_list/core/utils/to_mapper_mixins.dart';
import 'package:todo_list/data/models/category.dart';

class Task extends Equatable with ToMapper {

  static const tableName = 'tbl_task';

  final String name;
  final DateTime? dateTime;
  final Category category;
  final bool complated;

  bool isTodayTask() {
    return dateTime?.day == DateTime.now().day;
  }

  const Task(
      {required this.name, required this.category, this.complated = false, this.dateTime });

  @override
  List<Object?> get props => [name, dateTime, category];

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateTime': dateTime.toString(),
      'complated': complated ? 1 : 0,
      'category_id': category.id,
    };
  }
}
