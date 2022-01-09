import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository.dart';
import 'package:todo_list/domain/usecases/get_categories.dart';

import 'get_categories_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  late CategoryRepository repository;
  late GetCategories sut;
  late List<Category> listCategories;

  setUp(() {
    repository = MockCategoryRepository();
    listCategories = [
      const Category(name: "Work"),
      const Category(name: "Shoping")
    ];
    sut = GetCategories(repository: repository);
  });

  group('get categories', () {
    test('should return list of categories', () async {
      // arrange
      when(repository.all()).thenAnswer((_) async => listCategories);
      // act
      final actual = await sut();
      // assert
      verify(repository.all());
      verifyNoMoreInteractions(repository);
      expect(actual, listCategories);
    });
  });
}
