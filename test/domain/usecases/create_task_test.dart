import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/data/models/task.dart';
import 'package:todo_list/domain/repositories/task_repository.dart';
import 'package:todo_list/domain/usecases/create_task.dart';

import 'create_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  
  late CreateTask sut;
  late TaskRepository mockRepository;
  late Category category;
  late Task task;

  setUp(() {
    category = const Category(name: "Work");
    task = Task(name: "Meeting", category: category);
    mockRepository = MockTaskRepository();
    
    sut = CreateTask(repository: mockRepository);
  });

  group('create task', () {
    
    test('should create task with repository', () async {
      // arrange
      when(mockRepository.create(task: task)).thenAnswer((_) async => task);

      // act
      final actual = await sut(task: task);

      // assert
      verify(mockRepository.create(task: task));
      expect(actual, task);
      verifyNoMoreInteractions(mockRepository);
     });
  });
}
