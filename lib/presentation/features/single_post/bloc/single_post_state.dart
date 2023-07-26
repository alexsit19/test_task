import 'package:equatable/equatable.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_state.dart';
import 'package:test_task/domain/post.dart';

class SinglePostState extends Equatable {
  final Loading loading;
  final Exception? error;
  final Post? post;

  const SinglePostState({required this.loading, this.error, this.post});

  SinglePostState copyWith({
    required Loading loading,
    Exception? error,
    Post? post,
  }) {
    return SinglePostState(
      loading: loading,
      post: post ?? this.post,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, post, error];
}
