import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/data/models/task.dart';

void main() {
  late Category workCategory;

  setUp(() {
    workCategory = const Category(name: "Work");
  });

  group("task model", () {
    test('create task model with category', () async {
      // asset
      Task(name: "Meeting", category: workCategory, isToday: true);
    });

    test('category on task must same with created category on constructor ',
        () async {
      // arrange
      final sut = Task(name: "Inteview", category: workCategory);

      // assert
      expect(sut.category, workCategory);
    });

    test('should be instance of equatable', () async {
      // arrange
      final sut = Task(name: "Test", category: workCategory);

      // assert
      // ignore: unnecessary_type_check
      assert(sut is Equatable);
    });
  });
}
