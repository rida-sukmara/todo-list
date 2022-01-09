import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository.dart';
import 'package:todo_list/domain/usecases/create_category.dart';

import 'create_category_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  late MockCategoryRepository mockCategoryRepository;
  late Category category;

  late CreateCategory sut;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    category = const Category(name: "Work");
    sut = CreateCategory(repository: mockCategoryRepository);
  });

  group('repository test', () {
    
    test('create repository', () async {
      // arrange
      when(mockCategoryRepository.create(category: category)).thenAnswer((_) async => category);
      // act
      final actual = await sut(category: category);

      // assert
      verify(mockCategoryRepository.create(category: category));
      verifyNoMoreInteractions(mockCategoryRepository);
      expect(actual, category);
     });
  });
}
