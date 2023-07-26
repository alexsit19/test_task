import 'package:test_task/domain/post.dart';

abstract class Repository {
  Future<List<Post>?> getPosts();

  Future<Post?> getPostById(int? id);
}
