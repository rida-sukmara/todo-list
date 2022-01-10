import 'package:equatable/equatable.dart';
import 'package:todo_list/core/utils/to_mapper_mixins.dart';

class Category extends Equatable with ToMapper {
  static const tableName = 'tbl_category';
  final String name;
  final int id;

  const Category({required this.name, this.id = 0});

  @override
  List<Object?> get props => [name];

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name
    };
  }
}
