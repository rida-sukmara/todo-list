import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/data/models/task.dart';
import 'package:todo_list/domain/repositories/task_repository.dart';
import 'package:todo_list/domain/usecases/get_today_tasks.dart';

import 'get_today_tasks_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  
  late TaskRepository mockRepository;
  const category = Category(name: "Work");
  late GetTodayTasks sut;
  DateTime today = DateTime.now();

  final todayTaskList = [
     Task(name: "One", category: category, dateTime: today),
     Task(name: "Two", category: category, dateTime: today)
  ];

  setUp(() {
    mockRepository = MockTaskRepository();

    sut = GetTodayTasks(repository: mockRepository);
  });
  group('get today tasks usecase', () {
    test('should return todays', () async {
      // arrange
      when(mockRepository.todayTasks()).thenAnswer((_) async => todayTaskList);
      // act
      final actual = await sut();
      // assert
      verify(mockRepository.todayTasks());
      verifyNoMoreInteractions(mockRepository);
      expect(actual, todayTaskList);
     });
  });
}
