import 'package:flutter/cupertino.dart';
import 'package:test_task/domain/post.dart';

@immutable
sealed class PostsState {}

final class Loading extends PostsState {}

final class Success extends PostsState {
  final List<Post>? posts;

  Success({required this.posts});
}

final class Error extends PostsState {
  final Exception? error;

  Error({required this.error});
}
