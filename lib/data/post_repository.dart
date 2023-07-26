import 'dart:async';
import 'dart:convert';
import 'package:test_task/domain/post.dart';
import 'package:test_task/domain/repository.dart';
import 'package:http/http.dart' as http;
import 'package:test_task/domain/exceptions.dart';

class PostRepository implements Repository {
  final http.Client httpClient;

  const PostRepository({required this.httpClient});

  @override
  Future<Post?> getPostById(int? id) async {
    if (id == null) {
      throw UnknownException();
    }
    try {
      var httpResponse = await httpClient
          .get(Uri.https(
            'jsonplaceholder.typicode.com',
            '/posts/$id',
          ))
          .timeout(const Duration(seconds: 5));

      if (httpResponse.statusCode == 200) {
        var data = json.decode(httpResponse.body);
        Post post = Post.fromJson(data);
        return post;
      }
    } on Exception catch (error) {
      throw _getException(error);
    }
    return null;
  }

  @override
  Future<List<Post>?> getPosts() async {
    List<Post> posts = List.empty();
    try {
      var httpResponse = await httpClient
          .get(Uri.https(
            'jsonplaceholder.typicode.com',
            '/posts',
          ))
          .timeout(const Duration(seconds: 5));

      if (httpResponse.statusCode == 200) {
        var data = json.decode(httpResponse.body) as List;
        posts = data.map((item) => Post.fromJson(item)).toList();
        return posts;
      }
    } on Exception catch (error) {
      throw _getException(error);
    }
    return null;
  }

  Exception _getException(Exception error) {
    Exception exception = NoConnectionException();
    if (error is TimeoutException) {
      exception = DataRetrieveException();
    }
    return exception;
  }
}
