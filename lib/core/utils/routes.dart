 import 'package:flutter/widgets.dart';
import 'package:todo_list/presentation/widgets/category_list_screen.dart';
import 'package:todo_list/presentation/widgets/create_category_screen.dart';
import 'package:todo_list/presentation/widgets/home_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  CategoryListScreen.routeName: (context) => CategoryListScreen(),
  CreateCategoryScreen.routeName: (context) => CreateCategoryScreen()
};
