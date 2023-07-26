import 'package:flutter/material.dart';
import 'package:test_task/domain/post.dart';
import 'package:test_task/presentation/widgets/single_post_row.dart';

class SinglePostContent extends StatelessWidget {
  final Post? post;

  const SinglePostContent({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SinglePostRow(
          rowName: "userId",
          textContent: post?.userId.toString() ?? "",
          weight: FontWeight.bold,
          size: 14,
        ),
        SinglePostRow(
          rowName: "id",
          textContent: post?.id.toString() ?? "",
          weight: FontWeight.bold,
          size: 14,
        ),
        Row(children: [
          Flexible(
            child: Text(
              post?.body ?? "",
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
        ]),
      ],
    );
  }
}
