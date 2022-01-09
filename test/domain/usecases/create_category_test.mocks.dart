// Mocks generated by Mockito 5.0.17 from annotations
// in todo_list/test/domain/usecases/create_category_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_list/data/models/category.dart' as _i2;
import 'package:todo_list/domain/repositories/category_repository.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCategory_0 extends _i1.Fake implements _i2.Category {}

/// A class which mocks [CategoryRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryRepository extends _i1.Mock
    implements _i3.CategoryRepository {
  MockCategoryRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Category> create({_i2.Category? category}) =>
      (super.noSuchMethod(Invocation.method(#create, [], {#category: category}),
              returnValue: Future<_i2.Category>.value(_FakeCategory_0()))
          as _i4.Future<_i2.Category>);
}
