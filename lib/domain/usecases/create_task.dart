import 'package:todo_list/data/models/task.dart';
import 'package:todo_list/domain/repositories/task_repository.dart';

class CreateTask {
  final TaskRepository repository;

  CreateTask({ required this.repository });

  Future<Task> call({required Task task}) async {
    return await repository.create(task: task);
  }
}
