import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/datasources/local/category_local_datasource_impl.dart';
import 'package:todo_list/domain/repositories/category_repository_impl.dart';
import 'package:todo_list/presentation/cubit/category_cubit.dart';
import 'package:todo_list/presentation/widgets/create_category_screen.dart';

class CategoryListScreen extends StatelessWidget {
  static const routeName = '/categories';

  late final CategoryCubit categoryCubit;
  late final CategoryRepositoryImpl repository;
  late final CategoryLocalDatasourceImpl localDatastore;

  CategoryListScreen({Key? key}) : super(key: key) {
    localDatastore = CategoryLocalDatasourceImpl();
    repository = CategoryRepositoryImpl(localDatasource: localDatastore);
    categoryCubit = CategoryCubit(repository: repository);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => categoryCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.indigo,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateCategoryScreen.routeName)
                .then((_) => categoryCubit.all());
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: width,
          color: Colors.white,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Text("Loading");
              }

              if (state is CategoryListLoaded) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.indigo.shade900.withAlpha(200),
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                margin:
                                    const EdgeInsets.only(top: 6, bottom: 6),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.indigo.shade100.withAlpha(50),
                                ),
                                child: Text(
                                  state.items[index].name,
                                  style: TextStyle(
                                      color: Colors.indigo.shade500,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }))
                  ],
                );
              }
              return const Center(
                  child: Text(
                "No categories created.",
              ));
            },
          ),
        ),
      ),
    );
  }
}
