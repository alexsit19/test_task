import 'package:flutter/material.dart';
import 'package:test_task/presentation/widgets/list_item.dart';
import 'package:test_task/domain/post.dart';

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(
            id: posts[index].id,
            title: posts[index].title,
            body: posts[index].body,
          );
        });
  }
}
