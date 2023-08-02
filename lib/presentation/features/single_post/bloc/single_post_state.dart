import 'package:flutter/material.dart';
import 'package:test_task/domain/post.dart';

@immutable
sealed class SinglePostState {}

final class Loading extends SinglePostState {}

final class Success extends SinglePostState {
  final Post? post;
  Success({required this.post});
}

final class Error extends SinglePostState {
  final Exception? error;
  Error({required this.error});
}
