import 'package:equatable/equatable.dart';
import 'package:test_task/domain/post.dart';

enum Loading { loading, loaded }

class PostsState extends Equatable {
  final Loading loading;
  final Exception? error;
  final List<Post> posts;

  const PostsState({required this.loading, this.error, this.posts = const <Post>[]});

  PostsState copyWith({
    required Loading loading,
    Exception? error,
    List<Post>? posts,
  }) {
    return PostsState(
      loading: loading,
      posts: posts ?? this.posts,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, posts, error];
}
