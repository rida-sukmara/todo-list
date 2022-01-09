import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/data/models/category.dart';

void main() {
  group('models', () {
    test('should create category with name constructor', () async {
      const categoryName = "Work";
      // arrange
      const sut = Category(name: categoryName);

      // assert
      expect(sut.name, categoryName);
    });

    test('should instance of equitable', () async {
      // arrange
      const sut = Category(name: "Personal");

      // assert
      // ignore: unnecessary_type_check
      assert(sut is Equatable);
    });
  });
}
