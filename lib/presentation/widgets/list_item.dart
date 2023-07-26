import 'package:flutter/material.dart';
import 'package:test_task/presentation/navigation/app_routes.dart';

class ListItem extends StatelessWidget {
  final int id;
  final String title;
  final String body;

  const ListItem({Key? key, required this.id, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.singlePostScreen, arguments: id);
        },
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(body),
        ),
      ),
    );
  }
}
