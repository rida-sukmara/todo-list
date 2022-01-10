import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/data/models/task.dart';
import 'package:todo_list/domain/repositories/task_repository.dart';
import 'package:todo_list/domain/usecases/get_tasks.dart';

import 'get_tasks_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {

  late List<Task> listTask;
  late TaskRepository mockRepository;
  late GetTasks sut;
  late Category category;

  setUp((){
    mockRepository = MockTaskRepository();
    category = const Category(name: "Work");
    listTask = [
      Task(name: "Personal", category: category),
      Task(name: "Work", category: category)
    ];
    sut = GetTasks(repository: mockRepository);
  });

  group('getTasks usecase', () {
    test('should return list of task', () async {
      // arrange
      when(mockRepository.tasks()).thenAnswer((_) async => listTask);
      // act
      final actual = await sut();
      // assert
      verify(mockRepository.tasks());
      verifyNoMoreInteractions(mockRepository);
      expect(actual, listTask);
     });
  });

}