import 'package:flutter/material.dart';
import 'package:todo_list/presentation/widgets/category_list_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CategoryListScreen.routeName);
                },
              ),
              ListTile(
                title: const Text('Todos'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text("Homepage"),
      ),
    );
  }
}
