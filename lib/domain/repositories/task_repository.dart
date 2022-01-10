import 'package:todo_list/data/models/task.dart';

abstract class TaskRepository {
  Future<Task> create({ required Task task });
  Future<Task> delete({ required Task task });
  Future<Task> complate({ required Task task });
  Future<List<Task>> tasks();
}
