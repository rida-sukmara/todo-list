import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/datasources/local/category_local_datasource_impl.dart';
import 'package:todo_list/data/models/category.dart';
import 'package:todo_list/domain/repositories/category_repository_impl.dart';
import 'package:todo_list/presentation/cubit/category_cubit.dart';

class CreateCategoryScreen extends StatelessWidget {
  static const routeName = 'categories/create';
  late final CategoryRepositoryImpl repository;
  late final CategoryLocalDatasourceImpl localDatastore;

  // ignore: fixme
  //FIXME: Change to dependency injection
  CreateCategoryScreen({Key? key}) : super(key: key) {
    localDatastore = CategoryLocalDatasourceImpl();
    repository = CategoryRepositoryImpl(localDatasource: localDatastore);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(repository: repository),
      child: BlocListener<CategoryCubit, CategoryState>(
        listener: (context, state) {
          final scafoldMessage = ScaffoldMessenger.of(context);

          void showMessage (String message) {
            scafoldMessage.showSnackBar(SnackBar(content: Text(message)));
          }

          if (state is CategoryFailure) {
            showMessage(state.message);
          }
          if (state is CategoryCreated) {
            Navigator.pop(context);
            showMessage("Category ${state.category.name} was created.");
            context.read<CategoryCubit>().all();
          }
          
        },
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return Scaffold(
                body: SafeArea(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: FloatingActionButton(
                        splashColor: Colors.indigo[300],
                        backgroundColor: Colors.indigo[500],
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextField(
                    onChanged: (name) {
                      print("onChanged" + name);
                      context
                          .read<CategoryCubit>()
                          .onChangeCategoryName(name: name);
                    },
                    style:
                        const TextStyle(fontSize: 22, color: Colors.blueGrey),
                    decoration: const InputDecoration(
                        hintText: "Enter new Category",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.blueGrey)),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SizedBox(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.indigo),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ))),
                            onPressed: () {
                              context
                                  .read<CategoryCubit>()
                                  .create(category: Category(name: state.name));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("New Category"),
                                Icon(Icons.keyboard_arrow_up)
                              ],
                            )),
                      ),
                    )
                  ],
                )
              ],
            )));
          },
        ),
      ),
    );
  }
}
