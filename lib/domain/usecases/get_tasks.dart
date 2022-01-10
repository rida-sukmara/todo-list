import 'package:todo_list/data/models/task.dart';
import 'package:todo_list/domain/repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks({ required this.repository });

  Future<List<Task>> call() async {
    return await repository.tasks();
  }

}
