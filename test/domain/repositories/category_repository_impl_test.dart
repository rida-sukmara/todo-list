import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/datasources/local/category_local_datasource_impl.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository_impl.dart';

import 'category_repository_impl_test.mocks.dart';

@GenerateMocks([CategoryLocalDatasourceImpl])
void main() {
  
  late CategoryRepositoryImpl sut;
  late CategoryLocalDatasourceImpl mockLocalDatasource;
  late Category category; 
  late List<Category> listCategory;


  setUp(() {
    mockLocalDatasource = MockCategoryLocalDatasourceImpl();
    category = const Category(name: "Work");
    listCategory = [category];

    sut = CategoryRepositoryImpl(localDatasource: mockLocalDatasource);
  });

  group('category repository impl test', () {
    
    test('should return list of category', () async {
      // arrange
      when(mockLocalDatasource.all()).thenAnswer((_) async => listCategory);
      // act
      final actual = await sut.all();
      // assert
      verify(mockLocalDatasource.all());
      verifyNoMoreInteractions(mockLocalDatasource);
      expect(actual, listCategory);
     });

     test('should return task when created', () async {
       // arrange
       when(mockLocalDatasource.create(category: category)).thenAnswer((_) async => category);
       // act
       final actual = await sut.create(category: category);
       // assert
       verify(mockLocalDatasource.create(category: category));
       verifyNoMoreInteractions(mockLocalDatasource);
       expect(actual, category);
      });
  });
}
